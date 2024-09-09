import 'package:fixie_server/src/generated/goals/goal.dart';
import 'package:fixie_server/src/generated/notifications/notification.dart';
import 'package:fixie_server/src/managers/notification_manager.dart';
import 'package:serverpod/serverpod.dart';

class GoalManager {
  static void scheduleCurrentNotification(Session session, Goal goal) {
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

      String name = Uuid().v4();

      session.serverpod.registerFutureCall(
        NotificationFutureCall(),
        name,
      );

      session.serverpod.futureCallAtTime(
        name,
        Notification(
          title: goal.title,
          description: 'Got to do!',
          tokens: [goal.user?.fcmToken ?? ''],
        ),
        time,
      );
    }
  }
}
