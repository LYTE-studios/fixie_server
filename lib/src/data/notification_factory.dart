import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:fixie_server/src/data/notification_keywords_en.dart';
import 'package:fixie_server/src/data/notification_keywords_nl.dart';
import 'package:fixie_server/src/generated/locales/user_locales.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
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
      List<String> sentences =
          List<String>.from(motivationalData[bestMatchKey]?["sentences"] ?? []);
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

    String description = findBestMatchingPhrase(
      goal.title,
      locale?.locale ?? 'en',
    );

    String? imageUrl;

    if (goal.picture != null) {
      imageUrl ??=
          'notifications/${DateTimeUtils.formatDate(DateTime.now())}/images/${goal.id}.svg';

      await session.storage.storeFile(
        storageId: 'public',
        path: imageUrl,
        byteData: ByteData.view(utf8.encode(goal.picture!).buffer),
      );

      Uri? uri = await session.storage.getPublicUrl(
        storageId: 'public',
        path: imageUrl,
      );

      imageUrl = '${uri?.host ?? ''}${uri?.path ?? ''}';
    }

    return Notification(
      title: title,
      description: description,
      tokens: tokens,
      image: imageUrl,
    );
  }
}
