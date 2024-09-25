import 'dart:convert';

import 'package:firebase_cloud_messaging_flutter/firebase_cloud_messaging_flutter.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class NotificationFutureCall extends FutureCall<Notification> {
  @override
  Future<void> invoke(Session session, Notification? object) async {
    if (object == null) {
      Sentry.captureMessage('No notification was passed to Future task');
      return;
    }

    try {
      Notification notification = object;

      // Fetches the remote server
      FirebaseCloudMessagingServer server =
          await NotificationManager.getMessagingServer(
        session,
      );

      for (String token in notification.tokens) {
        if (notification.tokens.indexOf(token) > 0) {
          // Prevents the server from clogging
          await Future.delayed(
            Duration(milliseconds: 100),
          );
        }

        FirebaseSend send = FirebaseSend(
          validateOnly: false,
          message: FirebaseMessage(
            fcmOptions: FirebaseFcmOptions(),
            android: FirebaseAndroidConfig(),
            apns: FirebaseApnsConfig(),
            notification: FirebaseNotification(
              title: notification.title,
              body: notification.description,
            ),
            token: token,
          ),
        );

        ServerResult result = await server.send(
          send,
        );

        if (!result.successful) {
          Sentry.captureException(
            Exception(
              '${result.statusCode} Firebase message did not send - ${result.errorPhrase ?? ''}',
            ),
            hint: Hint.withMap({
              'data': send.toJson(),
              'exception': result.toString(),
              'message': result.messageSent.toJson(),
            }),
          );
        }
      }
    } catch (exception) {
      Sentry.captureException(exception);
    }
  }
}

class NotificationManager {
  /// Authenticates the server and returns the messaging server with given credentials
  static Future<FirebaseCloudMessagingServer> getMessagingServer(
    Session session,
  ) async {
    Map<String, dynamic> serviceAccount = jsonDecode(
      session.serverpod.getPassword('fcmServiceAccount') ?? '{}',
    );

    return FirebaseCloudMessagingServer(
      serviceAccount,
    );
  }

  /// Immediately sends a notification to the tokens given
  static void sendUserNotification(
    Session session, {
    required Notification notification,
  }) async {
    session.serverpod.futureCallWithDelay(
      'SendNotification',
      notification,
      Duration(
        seconds: 1,
      ),
    );
  }
}
