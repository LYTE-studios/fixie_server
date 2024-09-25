import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/category/category.dart';
import '../generated/goals/goal.dart';
import '../generated/users/user.dart';

class OpenAIService {
  String generateMotivationPrompt(
    Goal goal,
    String? locale,
  ) {
    // Default to English if locale is not provided
    locale ??= 'en';

    Category? category = goal.category;
    User? user = goal.user;

    // Start building the prompt dynamically
    String prompt = "Create a short and motivating notification for the user, ";

    // Add the goal's title
    prompt += "to register or accomplish the goal titled '${goal.title}'.";

    // Add unit and target if they are provided
    if (goal.unit != null && goal.unit!.isNotEmpty) {
      prompt += " The goal involves reaching ${goal.target} ${goal.unit}.";
    }

    // Mention the goal category if available
    if (category != null && category.title.isNotEmpty) {
      prompt += " This goal falls under the '${category.title}' category.";
    }

    // Mention the user's highest streak if available
    if (user != null && user.highestStreak != null) {
      prompt +=
          " the user has a personal best streak of ${user.highestStreak} days.";
    } else if (goal.highestStreak != null) {
      prompt +=
          " The user has reached a streak of ${goal.highestStreak} days in the past.";
    }

    // Add repetition and timing if available
    if (goal.repetition != null && goal.repeatEvery != null) {
      prompt +=
          " The goal should be repeated every ${goal.repeatEvery} ${goal.repetition!.name}.";
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
    prompt += " Keep it within 16 words and inspire action.";

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
                  'You are a helpful assistant that generates motivational messages.'
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
      final generatedText = data["choices"][0]["message"]["content"];

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
