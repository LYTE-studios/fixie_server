import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class OpenAIService {
  String getRepetitionDescription(Repetition? repetition) {
    switch (repetition) {
      case Repetition.Daily:
        return 'day';
      case Repetition.Weekly:
        return 'week';
      case Repetition.Monthly:
        return 'month';
      case Repetition.Yearly:
        return 'year';
      default:
        return 'day';
    }
  }

  String getGoalDescription(Goal goal) {
    String description = 'The goal\'s title is: \'${goal.title}\'. ';

    String repetitionDescription = getRepetitionDescription(goal.repetition);

    if (goal.repetition == Repetition.Daily &&
        (goal.weekdays?.isNotEmpty ?? false)) {
      repetitionDescription = '';

      for (int day in goal.weekdays ?? []) {
        repetitionDescription += DateTimeUtils.formatWeekday(day);

        if (goal.weekdays!.indexOf(day) != goal.weekdays!.length - 1) {
          if (goal.weekdays!.indexOf(day) == goal.weekdays!.length - 2) {
            repetitionDescription += ' and ';
          } else {
            repetitionDescription += ', ';
          }
        }
      }
    }

    description += "The user aims to do this every $repetitionDescription.";

    description +=
        'The goal\'s target value is: ${goal.target} with \'${goal.unit}\' as a unit of measurement. ';

    return description;
  }

  String generateMotivationPrompt(
    Goal goal,
    String? locale, {
    JournalLog? log,
  }) {
    // Default to English if locale is not provided
    locale ??= 'en';

    Category? category = goal.category;
    int currentHour = DateTime.now().hour;
    String timeContext = _getTimeContext(currentHour);
    String progress = _getProgressContext(goal, log);

    String prompt = """
You are an expert motivational coach specializing in personalized goal achievement. Create a short, impactful notification message that will inspire and motivate the user to engage with their goal tracking app.

CONTEXT:
${getGoalDescription(goal)}
Time of Day: $timeContext
Category: ${category?.title ?? 'Personal goal'}
Progress Status: $progress

NOTIFICATION REQUIREMENTS:
1. Maximum Length: 150 characters
2. Language: ${locale == 'nl' ? 'Dutch' : 'English'}
3. Tone: Encouraging, positive, and personalized
4. Must include a clear call-to-action

STYLE GUIDELINES:
- Be conversational but professional
- Use active voice
- Be specific to the goal type
- Incorporate time-appropriate messaging
- Avoid generic phrases
- Don't repeat the exact goal title (it's shown separately)
- Use emotive language that resonates with the goal category

EXAMPLES OF GREAT MESSAGES:
For a fitness goal in the morning:
"Fresh day, fresh energy! Those weights won't lift themselves. Ready to crush it?"

For a reading goal in the evening:
"The perfect time to dive into those pages. Your reading corner is calling!"

For a meditation goal when behind:
"A moment of calm awaits. Even 5 minutes can make a difference today."

For a learning goal when on track:
"You're building an amazing streak! Ready to add another achievement?"

BAD EXAMPLES TO AVOID:
- "Don't forget to do your goal"
- "Time to log your progress"
- "You can do it!"
- Generic motivational quotes

RESPONSE FORMAT:
Provide only the notification message, no explanations or quotes.
""";

    return prompt;
  }

  String _getTimeContext(int hour) {
    if (hour >= 5 && hour < 12) {
      return "Morning (Perfect for fresh starts and building momentum)";
    } else if (hour >= 12 && hour < 17) {
      return "Afternoon (Good for maintaining energy and progress)";
    } else if (hour >= 17 && hour < 22) {
      return "Evening (Ideal for reflection and completing daily goals)";
    } else {
      return "Night (Time for final check-ins and planning tomorrow)";
    }
  }

  String _getProgressContext(Goal goal, JournalLog? log) {
    if (log == null) {
      return "No activity logged yet for this period";
    }

    double progressPercentage = ((log.loggedValue ?? 0) / goal.target) * 100;
    if (progressPercentage >= 100) {
      return "Goal achieved! (${progressPercentage.toStringAsFixed(0)}% complete)";
    } else if (progressPercentage >= 75) {
      return "Nearly there! (${progressPercentage.toStringAsFixed(0)}% complete)";
    } else if (progressPercentage >= 50) {
      return "Good progress (${progressPercentage.toStringAsFixed(0)}% complete)";
    } else if (progressPercentage > 0) {
      return "Started (${progressPercentage.toStringAsFixed(0)}% complete)";
    } else {
      return "Ready to start";
    }
  }

  Future<String?> generateText(Session session, String prompt) async {
    final String apiKey = session.serverpod.getPassword('openApiKey')!;
    final dio = Dio()
      ..options.connectTimeout = Duration(seconds: 10)
      ..options.receiveTimeout = Duration(seconds: 10);

    try {
      final response = await dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
          validateStatus: (status) => status != null && status < 500,
        ),
        data: jsonEncode({
          'model': 'gpt-4-turbo-preview',
          'messages': [
            {
              'role': 'system',
              'content': '''
You are an expert motivational coach specializing in personalized notifications.
Your messages are always:
- Concise and impactful (max 150 characters)
- Highly personalized to the goal and context
- Action-oriented with clear next steps
- Time-appropriate and relevant
- Emotionally engaging without being pushy
Never use generic phrases or clichés.'''
            },
            {
              'role': 'user',
              'content': prompt,
            }
          ],
          'max_tokens': 100,
          'temperature':
              0.85, // Increased creativity while maintaining coherence
          'presence_penalty': 0.6, // Encourage more diverse responses
          'frequency_penalty': 0.4, // Reduce repetitive phrases
          'response_format': {'type': 'text'}, // Ensure clean text output
        }),
      );

      if (response.statusCode != 200) {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'OpenAI API error: ${response.statusCode}',
        );
      }

      final data = response.data;
      final String generatedText = data["choices"][0]["message"]["content"]
          .toString()
          .trim()
          .replaceAll('"', '')
          .replaceAll('\n', ' ');

      // Log the successful generation with context
      Sentry.captureMessage(
        'Generated notification message',
        hint: Hint.withMap({
          'prompt': prompt,
          'response': generatedText,
          'model': 'gpt-4-turbo-preview',
          'goal_type':
              prompt.contains('goal') ? prompt.split('"')[1] : 'unknown',
          'message_length': generatedText.length,
          'time_generated': DateTime.now().toIso8601String(),
        }),
      );

      return generatedText;
    } on DioException catch (e) {
      Sentry.captureException(
        e,
        hint: Hint.withMap({
          'prompt': prompt,
          'error_type': e.type.toString(),
          'error_message': e.message,
          'response': e.response?.data,
          'status_code': e.response?.statusCode,
        }),
      );
      return null;
    } catch (e) {
      Sentry.captureException(
        e,
        hint: Hint.withMap({
          'prompt': prompt,
          'error_type': 'Unexpected error',
          'error_message': e.toString(),
        }),
      );
      return null;
    }
  }
}
