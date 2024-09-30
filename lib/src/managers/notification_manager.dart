import 'dart:convert';

import 'package:firebase_cloud_messaging_flutter/firebase_cloud_messaging_flutter.dart';
import 'package:fixie_server/src/data/notification_factory.dart';
import 'package:fixie_server/src/endpoints/journal_endpoint.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class GoalNotificationFutureCall extends FutureCall<Goal> {
  @override
  Future<void> invoke(Session session, Goal? object) async {
    if (object == null || object.id == null) {
      Sentry.captureMessage('No notification was passed to Future task.');
      return;
    }

    Goal? goal = await Goal.db.findById(
      session,
      object.id!,
      include: Goal.include(
        category: Category.include(),
        user: User.include(
          userInfo: UserInfo.include(),
        ),
      ),
    );

    if (goal == null) {
      Sentry.captureMessage('No goal was found for passed id. ');
      return;
    }

    if (goal.user?.fcmToken?.isEmpty ?? true) {
      Sentry.captureMessage('User does not have a destination token.');
      return;
    }

    JournalListDto logs = await JournalEndpoint().getLogsForRange(
      session,
      start: DateTimeUtils.toStartOfDay(DateTime.now()),
      end: DateTimeUtils.toEndOfDay(
        DateTime.now(),
      ),
    );

    JournalLog? log = logs.daily.where((t) => t.goalId == goal.id).firstOrNull;
    log ??= logs.weekly.where((t) => t.goalId == goal.id).firstOrNull;
    log ??= logs.monthly.where((t) => t.goalId == goal.id).firstOrNull;
    log ??= logs.yearly.where((t) => t.goalId == goal.id).firstOrNull;

    Notification notification =
        await NotificationFactory.getNotificationForGoal(
      session,
      goal,
      log: log,
    );

    NotificationManager.sendUserNotification(
      session,
      notification: notification,
    );
  }
}

class NotificationFutureCall extends FutureCall<Notification> {
  @override
  Future<void> invoke(Session session, Notification? object) async {
    if (object == null) {
      Sentry.captureMessage('No notification was passed to Future task');
      return;
    }

    try {
      Notification notification = object;

      String? token =
          (await User.db.findById(session, notification.userId))?.fcmToken;

      if (token == null) {
        Sentry.captureMessage(
          'Notification was not sent. No FCM Token found for this user',
        );

        return;
      }

      // Fetches the remote server
      FirebaseCloudMessagingServer server =
          await NotificationManager.getMessagingServer(
        session,
      );

      FirebaseSend send = FirebaseSend(
        validateOnly: false,
        message: FirebaseMessage(
          fcmOptions: FirebaseFcmOptions(),
          android: FirebaseAndroidConfig(
              notification: FirebaseAndroidNotification(
            image: notification.image,
          )),
          apns: FirebaseApnsConfig(
            payload: {
              "aps": {"mutable-content": 1},
            },
            headers: notification.image == null
                ? {}
                : {
                    "image": notification.image!,
                  },
          ),
          notification: FirebaseNotification(
            title: notification.title,
            body: notification.description,
            image: notification.image,
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
