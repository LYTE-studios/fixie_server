import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:serverpod/serverpod.dart';

class JournalManager {
  static Future<JournalLog?> getDatedLog(
    Session session, {
    required Goal goal,
    required DateTime date,
    List<JournalLog>? cachedLogs,
  }) async {
    cachedLogs ??= await JournalLog.db.find(
      session,
      include: JournalLog.include(
        goal: Goal.include(category: Category.include()),
      ),
      where: (t) => t.goalId.equals(goal.id),
    );

    switch (goal.repetition) {
      case Repetition.Daily:
        {
          DateTime dayBefore = DateTime(
            date.year,
            date.month,
            date.day,
          ).subtract(Duration(days: 1));

          JournalLog? dayBeforeLog = cachedLogs.firstWhereOrNull(
            (log) =>
                (log.goal?.id == goal.id) &
                (log.date.year == dayBefore.year) &
                (log.date.month == dayBefore.month) &
                (log.date.day == dayBefore.day),
          );

          JournalLog? todayLog = cachedLogs.firstWhereOrNull(
            (log) =>
                (log.goal?.id == goal.id) &
                (log.date.year == date.year) &
                (log.date.month == date.month) &
                (log.date.day == date.day),
          );

          bool hasStreak = dayBeforeLog == null
              ? false
              : (dayBeforeLog.loggedValue ?? 0) >=
                    (dayBeforeLog.goal?.target.toDouble() ?? 0);

          todayLog?.streak = hasStreak;

          todayLog ??= JournalLog(
            goalId: goal.id!,
            goal: goal,
            note: '',
            createdAt: date,
            modifiedAt: date,
            streak: hasStreak,
            date: DateTime(date.year, date.month, date.day),
          );

          return todayLog;
        }
      case Repetition.Weekly:
        {
          DateTime dayBefore = DateTime(
            date.year,
            date.month,
            date.day,
          ).subtract(Duration(days: 7));

          JournalLog? dayBeforeLog = cachedLogs.firstWhereOrNull(
            (log) =>
                (log.goal?.id == goal.id) &&
                log.date.year == dayBefore.year &&
                (DateTimeUtils.weekNumber(log.date) ==
                    DateTimeUtils.weekNumber(dayBefore)),
          );

          JournalLog? todayLog = cachedLogs.firstWhereOrNull(
            (log) =>
                (log.goal?.id == goal.id) &&
                log.date.year == date.year &&
                (DateTimeUtils.weekNumber(log.date) ==
                    DateTimeUtils.weekNumber(date)),
          );

          bool hasStreak = dayBeforeLog == null
              ? false
              : (dayBeforeLog.loggedValue ?? 0) >=
                    (dayBeforeLog.goal?.target.toDouble() ?? 0);

          todayLog?.streak = hasStreak;

          todayLog ??= JournalLog(
            goalId: goal.id!,
            goal: goal,
            note: '',
            createdAt: date,
            modifiedAt: date,
            streak: hasStreak,
            date: DateTime(date.year, date.month, date.day),
          );

          return todayLog;
        }
      case Repetition.Monthly:
        {
          DateTime dayBefore = DateTime(
            date.year,
            date.month,
          ).subtract(Duration(days: 1));

          JournalLog? dayBeforeLog = cachedLogs.firstWhereOrNull(
            (log) =>
                (log.goal?.id == goal.id) &
                (log.date.year == dayBefore.year) &
                (log.date.month == dayBefore.month),
          );

          JournalLog? todayLog = cachedLogs.firstWhereOrNull(
            (log) =>
                (log.goal?.id == goal.id) &
                (log.date.year == date.year) &
                (log.date.month == date.month),
          );

          bool hasStreak = dayBeforeLog == null
              ? false
              : (dayBeforeLog.loggedValue ?? 0) >=
                    (dayBeforeLog.goal?.target.toDouble() ?? 0);

          todayLog?.streak = hasStreak;

          todayLog ??= JournalLog(
            goalId: goal.id!,
            goal: goal,
            note: '',
            createdAt: date,
            modifiedAt: date,
            streak: hasStreak,
            date: DateTime(date.year, date.month),
          );

          return todayLog;
        }
      case Repetition.Yearly:
        {
          JournalLog? todayLog = cachedLogs.firstWhereOrNull(
            (log) => (log.goal?.id == goal.id) & (log.date.year == date.year),
          );

          todayLog ??= JournalLog(
            goalId: goal.id!,
            goal: goal,
            note: '',
            createdAt: date,
            modifiedAt: date,
            streak: false,
            date: DateTime(date.year),
          );

          return todayLog;
        }
      default:
        return null;
    }
  }

  static Future<JournalListDto> getLogsForRange(
    Session session, {
    required DateTime start,
    required DateTime end,
    required User user,
  }) async {
    List<Goal> goals = await Goal.db.find(
      session,
      include: Goal.include(category: Category.include()),
      where: (t) =>
          (t.userId.equals(user.id) &
          t.archived.notEquals(true) &
          t.created.between(DateTime(1900), start.add(Duration(days: 1)))),
    );

    List<JournalLog> definedLogs = await JournalLog.db.find(
      session,
      include: JournalLog.include(
        goal: Goal.include(category: Category.include()),
      ),
      where: (t) => t.goalId.inSet(goals.map((e) => e.id!).toSet()),
    );

    JournalListDto dto = JournalListDto(
      daily: [],
      weekly: [],
      monthly: [],
      yearly: [],
    );

    void addLogToDto(JournalLog? log) {
      if (log == null) {
        return;
      }

      switch (log.goal?.repetition) {
        case Repetition.Daily:
          dto.daily.add(log);
        case Repetition.Weekly:
          dto.weekly.add(log);
        case Repetition.Monthly:
          dto.monthly.add(log);
        case Repetition.Yearly:
          dto.yearly.add(log);
        default:
          return;
      }
    }

    for (Goal goal in goals) {
      JournalLog? log = await getDatedLog(
        session,
        goal: goal,
        date: start,
        cachedLogs: definedLogs,
      );

      addLogToDto(log);
    }

    return dto;
  }
}
