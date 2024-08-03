import 'dart:io';
import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
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

  Future<List<JournalLog>> getLogsForRange(
    Session session, {
    required DateTime start,
    required DateTime end,
  }) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    int monthIndex = start.day + 7;

    int weekIndex = start.weekday;

    List<Goal> goals = await Goal.db.find(
      session,
      include: Goal.include(
        days: RepeatableDays.includeList(
          where: (t) => t.day.equals(monthIndex) | t.day.equals(weekIndex),
        ),
      ),
      where: (t) => (t.userId.equals(user.id)),
    );

    List<JournalLog> definedLogs = await JournalLog.db.find(
      session,
      where: (t) => t.goalId.inSet(
        goals.map((e) => e.id!).toSet(),
      ),
    );

    List<JournalLog> logs = [];

    for (Goal goal in goals) {
      JournalLog? definedLog = definedLogs.firstWhereOrNull(
        (e) => e.goalId == goal.id,
      );

      if (definedLog != null) {
        logs.add(definedLog);
        continue;
      }

      logs.add(
        JournalLog(
          goalId: goal.id!,
          text: '',
          createdAt: DateTime.now(),
          modifiedAt: DateTime.now(),
        ),
      );
    }

    return logs;
  }

  Future<int> addLog(Session session, int goalId, JournalLog log) async {
    await AuthUtils.getAuthenticatedUser(session);

    var goal = await Goal.db.findById(session, goalId);

    if (goal == null) {
      throw EndpointException(
        message: "Goal could not be found.",
        errorType: ErrorType.notFound,
      );
    }

    var newJournal = await JournalLog.db.insertRow(session, log);

    var journalCheck = await JournalLog.db.findById(session, newJournal.id!);

    if (journalCheck == null) {
      return HttpStatus.notModified;
    }

    return HttpStatus.ok;
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
      where: (p0) => p0.goalId.equals(goalId),
    );

    return list;
  }

  Future<JournalLog> updateLog(Session session, JournalLog editedLog) async {
    await AuthUtils.getAuthenticatedUser(session);

    var log = await JournalLog.db.findById(session, editedLog.id!);

    if (log == null) {
      throw EndpointException(
        message: 'Journal log could not be found.',
        errorType: ErrorType.notFound,
      );
    }

    return await JournalLog.db.updateRow(session, editedLog);
  }
}
