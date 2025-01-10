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

    // Start building the prompt dynamically
    String prompt =
        "Create a short and positive notification for a user that has set a goal in our app. ";

    // Add the goal's title
    prompt += getGoalDescription(goal);

    if (log != null && log.loggedValue != 0) {
      prompt +=
          " The user has currently logged a value of ${log.loggedValue ?? 0} ${goal.unit} for the current period.";
    }

    // Mention the goal category if available
    if (category != null && category.title.isNotEmpty) {
      prompt += " This goal falls under the '${category.title}' category.";
    }

    // Add locale to request output in a specific language
    prompt +=
        " Generate the description in the language of the locale: $locale.";

    // Ensure that the response stays concise
    prompt +=
        " Keep it within 16 words and mainly remind the user of the goal they have set out to do. The goal title doesn't have to be in this message literally, the notification title already contains this. Be inspiring in what you say and if possible, use terminology or add something clever specific to their goal.";

    prompt +=
        " If the user has already achieved the goal, please inspire them to achieve more.";

    prompt +=
        " You can be a bit creative, I don't want to see the same message repeatedly.";

    return prompt;
  }

  Future<String?> generateText(Session session, String prompt) async {
    try {
      final String apiKey = session.serverpod.getPassword('openApiKey')!;

      final response = await Dio().post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $apiKey',
          },
        ),
        data: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are a helpful assistant that generates motivating reminders.'
            },
            {
              'role': 'user',
              'content': prompt,
            }
          ],
          'max_tokens': 64, // Approx. 16 words
          'n': 1,
          'temperature': 0.7, // Creativity control
        }),
      );

      final data = response.data;

      final String generatedText = (await json.decode(
        json.encode(
          data["choices"][0]["message"]["content"] ?? '',
        ),
      ))
          .toString()
          .replaceAll('"', '');

      Sentry.captureMessage(
        'Saved prompt message',
        params: [
          prompt,
          generatedText,
        ],
      );

      return generatedText;
    } on DioException catch (e) {
      Sentry.captureException(
        e,
        hint: Hint.withMap(
          {
            'prompt': prompt,
          },
        ),
      );
      return null;
    }
  }
}
