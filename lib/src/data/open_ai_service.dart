import 'dart:convert';

import 'package:dio/dio.dart';

import '../generated/category/category.dart';
import '../generated/goals/goal.dart';
import '../generated/users/user.dart';

class OpenAIService {
  final String apiKey;
  final Dio _dio;

  OpenAIService(this.apiKey) : _dio = Dio() {
    _dio.options.headers['Authorization'] = 'Bearer $apiKey';
    _dio.options.headers['Content-Type'] = 'application/json';
  }

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

  Future<String> generateText(String prompt) async {
    const String apiUrl = 'https://api.openai.com/v1/completions';

    try {
      final response = await _dio.post(
        apiUrl,
        data: jsonEncode({
          'model': 'gpt-3.5-turbo',
          // You can change this to the model you want (e.g., GPT-4)
          'prompt': prompt,
          'max_tokens': 64,
          // Approx. 16 words (1 token ~ 0.75 words)
          'n': 1,
          'stop': ['.'],
          // Optional: stops response after a sentence.
          'temperature': 0.7,
          // Controls creativity
        }),
      );

      final data = response.data;
      final generatedText = data['choices'][0]['text'].trim();

      return generatedText;
    } on DioException catch (e) {
      print('Failed to fetch response: ${e.response?.data}');
      return 'Error occurred: ${e.response?.statusMessage}';
    }
  }
}