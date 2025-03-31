import 'dart:math';
import 'package:fixie_server/src/data/notification_factory.dart';
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

  Future<bool> isUserActive(Session session, User user) async {
    // Check last activity through journal logs
    JournalLog? lastLog = (await JournalLog.db.find(
      session,
      where: (t) => t.goal.userId.equals(user.id!),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: 1,
    ))
        .firstOrNull;

    if (lastLog == null) return false;

    // User is considered active if they have logged something in the last 3 days
    return DateTime.now().difference(lastLog.createdAt).inDays < 3;
  }

  Future<void> scheduleUserNotifications(Session session) async {
    // Get users with FCM tokens and automatic reminders enabled
    List<User> users = await User.db.find(
      session,
      where: (t) =>
          t.fcmToken.notEquals(null) &
          t.fcmToken.notEquals('') &
          t.automaticRemindersSetting.equals(true),
      include: User.include(
        goals: Goal.includeList(),
        userInfo: UserInfo.include(),
      ),
    );

    for (User user in users) {
      // Check if user is active
      bool isActive = await isUserActive(session, user);
      int notificationCount = 2; // Unavailable for now

      if (isActive && notificationCount < 2) {
        // For active users with less than 2 notifications, schedule an AI-powered notification
        if (user.goals?.isNotEmpty ?? false) {
          // Pick a random goal to send notification about
          var random = Random();
          Goal goal = user.goals![random.nextInt(user.goals!.length)];

          // Schedule notification for 10 AM
          DateTime now = DateTime.now();
          DateTime scheduleTime = DateTime(
            now.year,
            now.month,
            now.day,
            10, // 10 AM
            0,
          );

          // If it's past 10 AM, schedule for tomorrow
          if (now.hour >= 10) {
            scheduleTime = scheduleTime.add(Duration(days: 1));
          }

          Notification notification =
              await NotificationFactory.getNotificationForGoal(
            session,
            goal,
          );

          session.serverpod.futureCallAtTime(
            'SendNotification',
            notification,
            scheduleTime,
          );
        }
      } else {
        // For inactive users, check if they need a re-engagement notification
        JournalLog? lastLog = (await JournalLog.db.find(
          session,
          where: (t) => t.goal.userId.equals(user.id!),
          orderBy: (t) => t.createdAt,
          orderDescending: true,
          limit: 1,
        ))
            .firstOrNull;

        int daysInactive = lastLog == null
            ? 14 // If never active, treat as 14 days
            : DateTime.now().difference(lastLog.createdAt).inDays;

        // Only send notifications on 3rd, 7th and 14th day of inactivity
        if ([3, 7, 14].contains(daysInactive)) {
          // Get user's most engaged goal for personalized message
          Goal? mostEngagedGoal = user.goals?.reduce((a, b) =>
              (a.journal?.length ?? 0) > (b.journal?.length ?? 0) ? a : b);

          if (mostEngagedGoal != null) {
            Notification notification =
                await NotificationFactory.getNotificationForInactiveUser(
              session,
              mostEngagedGoal,
              daysInactive,
              lastLog: lastLog,
            );

            // Schedule for 10 AM
            DateTime now = DateTime.now();
            DateTime scheduleTime = DateTime(
              now.year,
              now.month,
              now.day,
              10, // 10 AM
              0,
            );

            // If it's past 10 AM, schedule for tomorrow
            if (now.hour >= 10) {
              scheduleTime = scheduleTime.add(Duration(days: 1));
            }

            session.serverpod.futureCallAtTime(
              'SendNotification',
              notification,
              scheduleTime,
            );
          }
        }
      }
    }
  }

  @override
  Future<void> invoke(Session session, dynamic object) async {
    await scheduleFixedGoalNotifications(session);
    await scheduleUserNotifications(session);

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
