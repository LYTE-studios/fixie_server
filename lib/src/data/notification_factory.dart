import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fixie_server/src/data/notification_keywords_en.dart';
import 'package:fixie_server/src/data/notification_keywords_nl.dart';
import 'package:fixie_server/src/data/open_ai_service.dart';
import 'package:fixie_server/src/generated/locales/user_locales.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/server.dart';

import '../generated/goals/goal.dart';

class NotificationFactory {
  static Map<String, Map<String, Map<String, List<String>>>> localeMap = {
    'en': notificationKeywordsEn,
    'nl': notificationKeywordsNl,
  };

  static Map<String, List<String>> fallBackLocaleMap = {
    'en': fallbackEn,
    'nl': fallbackNl,
  };

  // Function to find the best matching phrase based on the user's goal
  static String findBestMatchingPhrase(
    String title,
    String locale,
  ) {
    String? bestMatchKey;
    int maxKeywordMatches = 0;

    Map<String, Map<String, List<String>>> motivationalData =
        localeMap[locale] ?? notificationKeywordsEn;

    // Iterate through the motivational data
    motivationalData.forEach((key, value) {
      List<String> keywords = List<String>.from(value["keywords"] ?? []);
      int matchCount = 0;

      // Check how many keywords from the list match the user goal
      for (String keyword in keywords) {
        if (title.toLowerCase().contains(keyword.toLowerCase())) {
          matchCount++;
        }
      }

      // If more keywords match, update the best match
      if (matchCount > maxKeywordMatches) {
        maxKeywordMatches = matchCount;
        bestMatchKey = key;
      }
    });

    // Select a random sentence from the best matching set
    if (bestMatchKey != null) {
      List<String> sentences = List<String>.from(
        motivationalData[bestMatchKey]?["sentences"] ?? [],
      );
      return getRandomSentence(sentences);
    } else {
      List<String> sentences =
          List<String>.from(fallBackLocaleMap[locale] ?? fallbackEn);
      return getRandomSentence(sentences);
    }
  }

// Helper function to return a random sentence from a list
  static String getRandomSentence(List<String> sentences) {
    Random random = Random();
    int index = random.nextInt(sentences.length);
    return sentences[index];
  }

  static Future<Notification> getNotificationForGoal(
    Session session,
    Goal goal,
    List<String> tokens,
  ) async {
    UserLocales? locale = (await UserLocales.db.find(
      session,
      where: (t) => t.email.equals(goal.user?.userInfo?.email),
    ))
        .firstOrNull;

    String title = goal.title;

    final String apiKey = session.serverpod.getPassword('openApiKey')!;

    OpenAIService service = OpenAIService(apiKey);

    String prompt = service.generateMotivationPrompt(goal, locale?.locale);

    String description = await service.generateText(prompt);

    String? imageUrl;

    if (goal.picture != null) {
      try {
        Dio dio = Dio();

        Response response = await dio.post(
          "http://127.0.0.1:8000/svg-to-png",
          data: goal.picture!,
          options: Options(
            responseType: ResponseType.bytes,
          ),
        );

        ByteData pngBytes = response.data;

        imageUrl ??=
            'notifications/${DateTimeUtils.formatDate(DateTime.now())}/images/${goal.id}.png';

        await session.storage.storeFile(
          storageId: 'public',
          path: imageUrl,
          byteData: pngBytes,
        );

        Uri? uri = await session.storage.getPublicUrl(
          storageId: 'public',
          path: imageUrl,
        );

        imageUrl = 'https://${uri?.host ?? ''}${uri?.path ?? ''}';
      } catch (e) {
        Sentry.captureException(e);
      }
    }

    return Notification(
      title: title,
      description: description,
      tokens: tokens,
      image: imageUrl,
    );
  }
}
