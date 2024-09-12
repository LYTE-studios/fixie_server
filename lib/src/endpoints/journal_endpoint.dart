import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:fixie_server/src/utils/journal_utils.dart';
import 'package:intl/intl.dart';
import 'package:serverpod/serverpod.dart';

class JournalEndpoint extends Endpoint {
  Future<Map<String, String?>> getImageUploadDescription(
    Session session, {
    required JournalLog log,
    required String fileName,
  }) async {
    String path = 'logs/${log.id}/images/$fileName';

    String? description =
        await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );

    return {
      'description': description,
      'path': path,
    };
  }

  Future<bool> verifyUpload(Session session, String path) async {
    return await session.storage.verifyDirectFileUpload(
      storageId: 'public',
      path: path,
    );
  }

  Future<JournalListDto> getLogsForRange(
    Session session, {
    required DateTime start,
    required DateTime end,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

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

    /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
    int numOfWeeks(int year) {
      DateTime dec28 = DateTime(year, 12, 28);
      int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
      return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
    }

    /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
    int weekNumber(DateTime date) {
      int dayOfYear = int.parse(DateFormat("D").format(date));
      int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
      if (woy < 1) {
        woy = numOfWeeks(date.year - 1);
      } else if (woy > numOfWeeks(date.year)) {
        woy = 1;
      }
      return woy;
    }

    for (Goal goal in goals) {
      switch (goal.repetition) {
        case Repetition.Daily:
          {
            if (!(goal.weekdays?.contains(DateTime.now().weekday) ?? false)) {
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
                (log.goal?.id == goal.id) &
                (weekNumber(log.date) == weekNumber(start) - 1));

            JournalLog? todayLog = definedLogs.firstWhereOrNull((log) =>
                (log.goal?.id == goal.id) &
                (weekNumber(log.date) == weekNumber(start)));

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

  Future<JournalLog> addLog(Session session, int goalId, JournalLog log) async {
    await AuthUtils.getAuthenticatedUser(session);

    var goal = await Goal.db.findById(session, goalId);

    if (goal == null) {
      throw EndpointException(
        message: "Goal could not be found.",
        errorType: ErrorType.notFound,
      );
    }

    JournalLog created = await JournalLog.db.insertRow(session, log);

    var newLog = await JournalLog.db.findById(
      session,
      created.id!,
      include: JournalLog.include(
        goal: Goal.include(
          category: Category.include(),
        ),
      ),
    );

    if (newLog == null) {
      throw EndpointException(
        message: 'Journal log could not be created.',
        errorType: ErrorType.databaseError,
      );
    }

    return await JournalUtils.setStreakValues(session, newLog) ?? newLog;
  }

  Future<JournalLog?> getLog(Session session, int? logId) async {
    await AuthUtils.getAuthenticatedUser(session);

    var log = await JournalLog.db.findById(session, logId!);

    if (log == null) {
      throw EndpointException(
        message: 'Journal log could not be found.',
        errorType: ErrorType.notFound,
      );
    }

    return log;
  }

  Future<List<JournalLog>?> getJournal(
    Session session,
    int? goalId, {
    int? pageSize,
    int? offset,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<JournalLog> logs = [];

    if (goalId == null) {
      logs = await JournalLog.db.find(
        session,
        include: JournalLog.include(
          goal: Goal.include(
            category: Category.include(),
          ),
        ),
        where: (p0) => p0.goal.userId.equals(user.id),
      );
    } else {
      logs = await JournalLog.db.find(
        session,
        include: JournalLog.include(
          goal: Goal.include(
            category: Category.include(),
          ),
        ),
        where: (p0) => p0.goalId.equals(goalId),
      );
    }

    List<JournalLog> list = [...logs];

    for (JournalLog log in logs) {
      if (log.picture?.isEmpty ?? true) {
        list.remove(log);
      }
    }

    logs = list;

    logs.sort((a, b) => b.date.compareTo(a.date));

    if (pageSize != null) {
      if ((offset ?? 0) >= logs.length) {
        return [];
      }

      if (pageSize + (offset ?? 0) >= logs.length) {
        pageSize = logs.length - (offset ?? 0);
      }

      logs = logs.getRange(offset ?? 0, pageSize + (offset ?? 0)).toList();
    }

    return logs;
  }

  Future<JournalLog> updateLog(Session session, JournalLog editedLog) async {
    await AuthUtils.getAuthenticatedUser(session);

    await JournalLog.db.updateRow(session, editedLog);

    JournalLog? log = await JournalLog.db.findById(
      session,
      editedLog.id!,
      include: JournalLog.include(
        goal: Goal.include(
          category: Category.include(),
        ),
      ),
    );

    if (log == null) {
      throw EndpointException(
        message: 'Journal log could not be found.',
        errorType: ErrorType.notFound,
      );
    }

    return await JournalUtils.setStreakValues(session, log) ?? log;
  }
}
