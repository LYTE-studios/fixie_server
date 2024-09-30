import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:serverpod/serverpod.dart';

class JournalManager {
  static Future<JournalListDto> getLogsForRange(
    Session session, {
    required DateTime start,
    required DateTime end,
    required User user,
  }) async {
    List<Goal> goals = await Goal.db.find(
      session,
      include: Goal.include(
        category: Category.include(),
      ),
      where: (t) => (t.userId.equals(user.id) &
          t.archived.notEquals(true) &
          t.created.between(
            DateTime(1900),
            start.add(
              Duration(days: 1),
            ),
          )),
    );

    List<JournalLog> definedLogs = await JournalLog.db.find(
      session,
      include: JournalLog.include(
        goal: Goal.include(
          category: Category.include(),
        ),
      ),
      where: (t) => t.goalId.inSet(
        goals.map((e) => e.id!).toSet(),
      ),
    );

    JournalListDto dto = JournalListDto(
      daily: [],
      weekly: [],
      monthly: [],
      yearly: [],
    );

    for (Goal goal in goals) {
      switch (goal.repetition) {
        case Repetition.Daily:
          {
            if (!(goal.weekdays?.contains(start.weekday) ?? false)) {
              continue;
            }

            JournalLog? dayBeforeLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) & (log.date.day == start.day - 1));

            JournalLog? todayLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) & (log.date.day == start.day));

            bool hasStreak = dayBeforeLog == null
                ? false
                : (dayBeforeLog.loggedValue ?? 0) >=
                    (dayBeforeLog.goal?.target.toDouble() ?? 0);

            todayLog?.streak = hasStreak;

            todayLog ??= JournalLog(
              goalId: goal.id!,
              goal: goal,
              note: '',
              createdAt: start,
              modifiedAt: start,
              streak: hasStreak,
              date: DateTime(
                end.year,
                end.month,
                end.day,
              ),
            );

            dto.daily.add(todayLog);
          }
        case Repetition.Weekly:
          {
            JournalLog? dayBeforeLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) &&
                log.date.year == start.year &&
                (DateTimeUtils.weekNumber(log.date) ==
                    DateTimeUtils.weekNumber(start) - 1));

            JournalLog? todayLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) &&
                log.date.year == start.year &&
                (DateTimeUtils.weekNumber(log.date) ==
                    DateTimeUtils.weekNumber(start)));

            bool hasStreak = dayBeforeLog == null
                ? false
                : (dayBeforeLog.loggedValue ?? 0) >=
                    (dayBeforeLog.goal?.target.toDouble() ?? 0);

            todayLog?.streak = hasStreak;

            todayLog ??= JournalLog(
              goalId: goal.id!,
              goal: goal,
              note: '',
              createdAt: start,
              modifiedAt: start,
              streak: hasStreak,
              date: DateTime(
                end.year,
                end.month,
                end.day,
              ),
            );

            dto.weekly.add(todayLog);
          }
        case Repetition.Monthly:
          {
            JournalLog? dayBeforeLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) &
                (log.date.month == log.date.month - 1));

            JournalLog? todayLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) & (log.date.month == start.month));

            bool hasStreak = dayBeforeLog == null
                ? false
                : (dayBeforeLog.loggedValue ?? 0) >=
                    (dayBeforeLog.goal?.target.toDouble() ?? 0);

            todayLog?.streak = hasStreak;

            todayLog ??= JournalLog(
              goalId: goal.id!,
              goal: goal,
              note: '',
              createdAt: start,
              modifiedAt: start,
              streak: hasStreak,
              date: DateTime(
                end.year,
                end.month,
                end.day,
              ),
            );

            dto.monthly.add(todayLog);
          }
        case Repetition.Yearly:
          {
            JournalLog? todayLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) & (log.date.year == start.year));

            todayLog ??= JournalLog(
              goalId: goal.id!,
              goal: goal,
              note: '',
              createdAt: start,
              modifiedAt: start,
              streak: false,
              date: DateTime(
                end.year,
                end.month,
                end.day,
              ),
            );

            dto.yearly.add(todayLog);
          }
        default:
      }
    }

    return dto;
  }
}
