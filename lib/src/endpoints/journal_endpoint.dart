import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:fixie_server/src/utils/journal_utils.dart';
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
      where: (t) =>
          t.goalId.inSet(
            goals.map((e) => e.id!).toSet(),
          ) &
          (t.date.between(
                start.subtract(Duration(days: 1)),
                end,
              ) |
              t.date.equals(
                start,
              )),
    );

    JournalListDto dto = JournalListDto(
      daily: [],
      weekly: [],
      monthly: [],
      yearly: [],
    );

    for (Goal goal in goals) {
      JournalLog? dayBeforeLog = definedLogs.firstWhereOrNull(
          (log) => (log.goal?.id == goal.id) & (log.date.day == start.day));

      bool hasStreak = dayBeforeLog == null
          ? false
          : (dayBeforeLog.loggedValue ?? 0) >=
              (dayBeforeLog.goal?.target.toDouble() ?? 0);

      JournalLog? definedLog = definedLogs.firstWhereOrNull(
        (e) => e.goalId == goal.id,
      );

      void addLogToRepetition(JournalLog journalLog) {
        switch (journalLog.goal?.repetition) {
          case Repetition.Daily:
            dto.daily.add(journalLog);
          case Repetition.Weekly:
            dto.weekly.add(journalLog);
          case Repetition.Monthly:
            dto.monthly.add(journalLog);
          case Repetition.Yearly:
            dto.yearly.add(journalLog);
          default:
        }
      }

      definedLog?.streak = hasStreak;

      definedLog ??= JournalLog(
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

      addLogToRepetition(definedLog);
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

  Future<List<JournalLog>?> getJournal(Session session, int? goalId) async {
    await AuthUtils.getAuthenticatedUser(session);

    var list = await JournalLog.db.find(
      session,
      include: JournalLog.include(
        goal: Goal.include(
          category: Category.include(),
        ),
      ),
      where: (p0) =>
          p0.goalId.equals(goalId) &
          (p0.note.notEquals('') | p0.note.notEquals(null)),
    );

    return list;
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
