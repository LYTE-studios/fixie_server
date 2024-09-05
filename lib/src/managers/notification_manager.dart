import 'package:dio/dio.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:serverpod/serverpod.dart';

class NotificationFutureCall extends FutureCall<Notification> {
  @override
  Future<void> invoke(Session session, Notification? object) async {
    if (object == null) {
      return;
    }
  }
}

class NotificationManager {
  /// Sends a notification to the tokens given
  static Future<void> sendUserNotification(
    Session session, {
    required Notification notification,
  }) async {
    Dio dio = Dio();

    session.serverpod.futureCallWithDelay(
      'notification - ${DateTime.now().millisecondsSinceEpoch}',
      object,
      delay,
    );

    for (String token in tokens) {
      await dio.postUri(
        Uri.parse(
          'https://fcm.googleapis.com/v1/projects/fixie-6ca0b/messages:send',
        ),
        data: {
          "message": {
            "token": "bk3RNwTe3H0:CI2k_HHwgIpoDKCIZvvDMExUdFQ3P1...",
            "notification": {
              "body": description,
              "title": title,
            }
          },
        },
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'key=AIzaSyADD1Nbw5IiUjC40lJ_OKx2A0z3m4THpqk',
          },
        ),
      );
    }
  }
}
