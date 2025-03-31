import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:fixie_server/src/data/notification_keywords_en.dart';
import 'package:fixie_server/src/data/notification_keywords_nl.dart';
import 'package:fixie_server/src/data/open_ai_service.dart';
import 'package:fixie_server/src/generated/journals/journal_log.dart';
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
    Goal goal, {
    JournalLog? log,
  }) async {
    UserLocales? locale = (await UserLocales.db.find(
      session,
      where: (t) => t.email.equals(goal.user?.userInfo?.email),
    ))
        .firstOrNull;

    String title = goal.title;

    OpenAIService service = OpenAIService();

    String prompt = service.generateMotivationPrompt(
      goal,
      locale?.locale,
      log: log,
    );

    String? description;

    try {
      description = await service.generateText(session, prompt);
    } catch (e) {
      Sentry.captureException(e);
    }

    description ??= NotificationFactory.findBestMatchingPhrase(
      goal.title,
      locale?.locale ?? 'en',
    );

    String? imageUrl;

    if (goal.picture != null) {
      try {
        Dio dio = Dio();

        Response response = await dio.post(
          "http://127.0.0.1:8000/svg-to-png",
          data: goal.picture!,
          options: Options(
            responseType: ResponseType.json,
          ),
        );

        Uint8List bytes = base64Decode(response.data);

        ByteData pngBytes = ByteData.view(bytes.buffer);

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
      userId: goal.userId,
      image: imageUrl,
    );
  }

  static String generateReengagementPrompt(
    Goal goal,
    String? locale, {
    JournalLog? lastLog,
    int daysInactive = 0,
  }) {
    String basePrompt = """
You are a supportive and motivating AI assistant. Create a short, engaging notification message (max 150 characters) to re-engage a user who hasn't logged into their goal tracking app for ${daysInactive} days.

Context:
- Their goal: "${goal.title}" (Target: ${goal.target} ${goal.unit ?? ''})
- Last activity: ${lastLog?.createdAt != null ? '$daysInactive days ago' : 'No previous activity'}
- Goal category: ${goal.category?.title ?? 'Personal goal'}

Consider these aspects:
1. Be encouraging without being pushy
2. Reference their specific goal
3. Keep it personal and warm
4. Avoid guilt-tripping
5. Include a clear call to action

The tone should be:
- Friendly and supportive
- Optimistic
- Genuinely caring
- Motivating without pressure

${locale == 'nl' ? 'Respond in Dutch.' : 'Respond in English.'}

Examples of good messages:
- "Your [goal] journey misses you! Ready to take a small step forward today?"
- "A quick check-in on your [goal] - even small progress counts!"
- "Miss tracking your [goal]? Let's pick up where you left off!"

Avoid:
- "You haven't logged in for X days"
- "You're falling behind"
- "Don't give up"

Response format: Just the notification message, no quotes or explanations.
""";

    return basePrompt;
  }

  static Future<Notification> getNotificationForInactiveUser(
    Session session,
    Goal goal,
    int daysInactive, {
    JournalLog? lastLog,
  }) async {
    UserLocales? locale = (await UserLocales.db.find(
      session,
      where: (t) => t.email.equals(goal.user?.userInfo?.email),
    ))
        .firstOrNull;

    String prompt = generateReengagementPrompt(
      goal,
      locale?.locale,
      lastLog: lastLog,
      daysInactive: daysInactive,
    );

    OpenAIService service = OpenAIService();
    String? description;

    try {
      description = await service.generateText(session, prompt);
    } catch (e) {
      Sentry.captureException(e);
    }

    description ??= NotificationFactory.findBestMatchingPhrase(
      goal.title,
      locale?.locale ?? 'en',
    );

    return Notification(
      title: "Welcome Back!",
      description: description,
      userId: goal.userId,
      image: goal.picture,
    );
  }
}
