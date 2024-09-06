import 'dart:convert';

import 'package:firebase_cloud_messaging_flutter/firebase_cloud_messaging_flutter.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:serverpod/serverpod.dart';

class NotificationFutureCall extends FutureCall<Notification> {
  Future<List<ServerResult>> send(
    Session session,
    Notification notification,
  ) async {
    FirebaseCloudMessagingServer server =
        await NotificationManager.getMessagingServer(
      session,
    );

    List<ServerResult> results = [];

    for (String token in notification.tokens) {
      if (notification.tokens.indexOf(token) > 0) {
        // Prevents the server from clogging
        await Future.delayed(
          Duration(milliseconds: 100),
        );
      }
      ServerResult result = await server.send(
        FirebaseSend(
          validateOnly: false,
          message: FirebaseMessage(
            notification: FirebaseNotification(
              title: notification.title,
              body: notification.description,
            ),
            token: token,
          ),
        ),
      );

      results.add(result);
    }

    return results;
  }

  @override
  Future<void> invoke(Session session, Notification? object) async {
    if (object == null) {
      return;
    }

    send(session, object);
  }
}

class NotificationManager {
  /// Authenticates the server and returns the messaging server with given credentials
  static Future<FirebaseCloudMessagingServer> getMessagingServer(
    Session session,
  ) async {
    Map<String, String> serviceAccount = jsonDecode(
      session.serverpod.getPassword('fcmServiceAccount') ?? '{}',
    );

    return FirebaseCloudMessagingServer(
      serviceAccount,
    );
  }

  /// Sends a notification to the tokens given
  static void sendUserNotification(
    Session session, {
    required Notification notification,
  }) async {
    session.serverpod.futureCallWithDelay(
      'NotificationFutureCall',
      notification,
      Duration(
        seconds: 1,
      ),
    );
  }
}
