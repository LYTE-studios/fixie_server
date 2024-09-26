import 'package:fixie_server/src/data/notification_factory.dart';
import 'package:fixie_server/src/generated/goals/goal.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:serverpod/serverpod.dart';

class GoalManager {
  static Future<void> scheduleCurrentNotification(
    Session session,
    Goal goal,
  ) async {
    if (goal.user?.fcmToken == null) {
      return;
    }

    for (DateTime reminder in goal.reminders ?? []) {
      DateTime now = DateTime.now();

      DateTime time = DateTime(
        now.year,
        now.month,
        now.day,
        reminder.hour,
        reminder.minute,
      );

      if (time.isBefore(now)) {
        return;
      }

      Notification notification =
          await NotificationFactory.getNotificationForGoal(
        session,
        goal,
        [goal.user?.fcmToken ?? ''],
      );

      session.serverpod.futureCallAtTime(
        'SendNotification',
        notification,
        time,
      );
    }
  }
}
