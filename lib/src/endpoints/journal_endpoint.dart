import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class JournalEndpoint extends Endpoint {
  Future<int> addLog(Session session, int goalId, JournalLog log) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
        message: "User could not be found. Are you authenticated?",
        errorType: ErrorType.authenticationError,
      );
    } else {
      var goal = await Goal.db.findById(session, goalId);
      if (goal == null) {
        throw EndpointException(
            message: "Goal could not be found(addLog).",
            errorType: ErrorType.notFound);
      } else {
        var newJournal = await JournalLog.db.insertRow(session, log);
        var journalCheck =
            await JournalLog.db.findById(session, newJournal.id!);
        if (journalCheck == null) {
          return HttpStatus.notModified;
        } else {
          return HttpStatus.ok;
        }
      }
    }
  }

  Future<JournalLog?> getLog(Session session, int? logId) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message:
              'User could not be found. Are you sure you are authenticated?',
          errorType: ErrorType.authenticationError);
    } else {
      var log = await JournalLog.db.findById(session, logId!);
      if (log == null) {
        throw EndpointException(
            message: 'Journal log could not be found.',
            errorType: ErrorType.notFound);
      } else {
        return log;
      }
    }
  }

  Future<List<JournalLog>?> getJournal(Session session, int? goalId) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message:
              'User could not be found. Are you sure you are authenticated?',
          errorType: ErrorType.authenticationError);
    } else {
      var list = await JournalLog.db.find(
        session,
        where: (p0) => p0.goalId.equals(goalId),
      );
      return list;
    }
  }

  Future<JournalLog> updateLog(Session session, JournalLog editedLog) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message:
              'User could not be found. Are you sure you are authenticated?',
          errorType: ErrorType.authenticationError);
    } else {
      var log = await JournalLog.db.findById(session, editedLog.id!);
      if (log == null) {
        throw EndpointException(
            message: 'Journal log could not be found.',
            errorType: ErrorType.notFound);
      } else {
        return await JournalLog.db.updateRow(session, editedLog);
      }
    }
  }
}
