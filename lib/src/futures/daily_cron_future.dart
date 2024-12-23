import 'package:fixie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart';

class DailyCronFuture extends FutureCall {
  DateTime toTodayTime(DateTime dateTime) {
    DateTime now = DateTime.now();

    return DateTime(
      now.year,
      now.month,
      now.day,
      dateTime.hour,
      dateTime.minute,
    );
  }

  Future<void> scheduleFixedGoalNotifications(Session session) async {
    List<User> users = await User.db.find(
      session,
      where: (t) => t.fcmToken.notEquals(null) & t.fcmToken.notEquals(''),
    );

    List<Goal> goals = await Goal.db.find(
      session,
      include: Goal.include(
        user: User.include(
          userInfo: UserInfo.include(),
        ),
      ),
      where: (t) =>
          t.archived.equals(false) &
          t.userId.inSet(users.map((user) => user.id ?? 0).toSet()),
    );

    for (Goal goal in goals) {
      if (goal.reminders?.isEmpty ?? true) {
        continue;
      }

      if (goal.repetition == Repetition.Daily) {
        if (!(goal.weekdays?.contains(DateTime.now().weekday) ?? true)) {
          continue;
        }
      }

      for (DateTime reminder in goal.reminders ?? []) {
        session.serverpod.futureCallAtTime(
          'SendGoalNotification',
          IdDto(id: goal.id!),
          toTodayTime(reminder),
        );
      }
    }
  }

  @override
  Future<void> invoke(Session session, dynamic object) async {
    await scheduleFixedGoalNotifications(session);

    DateTime now = DateTime.now();
    DateTime next = DateTime(now.year, now.month, now.day + 1, 0, 0);
    await session.serverpod.futureCallAtTime(
      'DailyCron',
      null,
      next,
      identifier: next.toString(),
    );
  }
}
