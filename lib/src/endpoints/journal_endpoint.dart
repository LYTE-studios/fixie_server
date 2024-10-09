import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/managers/journal_manager.dart';
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

    return JournalManager.getLogsForRange(
      session,
      start: start,
      end: end,
      user: user,
    );
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
    int? categoryId,
    int? pageSize,
    int? offset,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<JournalLog> logs = [];

    if (goalId != null) {
      logs = await JournalLog.db.find(
        session,
        include: JournalLog.include(
          goal: Goal.include(
            category: Category.include(),
          ),
        ),
        where: (p0) =>
            p0.goalId.equals(goalId) & p0.goal.archived.notEquals(true),
      );
    } else if (categoryId != null) {
      logs = await JournalLog.db.find(
        session,
        include: JournalLog.include(
          goal: Goal.include(
            category: Category.include(),
          ),
        ),
        where: (p0) =>
            p0.goal.categoryId.equals(categoryId) &
            p0.goal.archived.notEquals(true),
      );
    } else {
      logs = await JournalLog.db.find(
        session,
        include: JournalLog.include(
          goal: Goal.include(
            category: Category.include(),
          ),
        ),
        where: (p0) =>
            p0.goal.userId.equals(user.id) & p0.goal.archived.notEquals(true),
      );
    }

    List<JournalLog> list = [...logs];

    for (JournalLog log in logs) {
      if (log.picture?.isEmpty ?? true) {
        list.remove(log);
      }
    }

    logs = list;

    logs.sort((a, b) => b.createdAt.compareTo(a.createdAt));

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

    if (editedLog.id == null) {
      return addLog(
        session,
        editedLog.goalId,
        editedLog,
      );
    }

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
