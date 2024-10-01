import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class OpenAIService {
  String generateMotivationPrompt(
    Goal goal,
    String? locale, {
    JournalLog? log,
  }) {
    // Default to English if locale is not provided
    locale ??= 'en';

    Category? category = goal.category;
    User? user = goal.user;

    // Start building the prompt dynamically
    String prompt = "Create a short and positive notification for the user, ";

    // Add the goal's title
    prompt += "to register or accomplish the goal titled '${goal.title}'.";

    // Add unit and target if they are provided
    if (goal.unit != null && goal.unit!.isNotEmpty) {
      prompt += " The goal involves reaching ${goal.target} ${goal.unit}";
    }

    // Add repetition and timing if available
    if (goal.repetition == Repetition.Daily &&
        (goal.weekdays?.isNotEmpty ?? false)) {
      String days = '';

      for (int day in goal.weekdays ?? []) {
        days += DateTimeUtils.formatWeekday(day);

        if (goal.weekdays!.indexOf(day) != goal.weekdays!.length - 1) {
          if (goal.weekdays!.indexOf(day) == goal.weekdays!.length - 2) {
            days += ' and ';
          } else {
            days += ', ';
          }
        }
      }

      prompt += " every $days.";
    } else {
      prompt +=
          " on a ${goal.repeatEvery == 1 ? '' : goal.repeatEvery ?? ''} ${goal.repetition!.name} basis.";
    }

    if (log != null && log.loggedValue != 0) {
      prompt +=
          " The user has currently logged a value of ${log.loggedValue ?? 0} ${goal.unit} for the current period. If this value has already reached its target, please inspire the user to achieve more.";
    }

    // Mention the goal category if available
    if (category != null && category.title.isNotEmpty) {
      prompt += " This goal falls under the '${category.title}' category.";
    }

    // Mention the user's highest streak if available
    if (user != null && user.highestStreak != null) {
      prompt +=
          " The user has a total personal best streak of ${user.highestStreak}.";
    }
    if (goal.highestStreak != null) {
      prompt +=
          " The user has a total personal best streak for this goal of ${goal.highestStreak}.";
    }

    // Encourage finishing strong if the goal has an end date
    if (goal.end != null && DateTime.now().isBefore(goal.end!)) {
      prompt +=
          " The goal ends on ${goal.end!.toLocal().toIso8601String().substring(0, 10)}.";
    }

    // Add locale to request output in a specific language
    prompt +=
        " Generate the description in the language of the locale: $locale.";

    // Ensure that the response stays concise
    prompt +=
        " Keep it within 16 words and mainly remind the user of the goal they have set out to do.";

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
                  'You are a helpful assistant that generates helpful reminders.'
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
