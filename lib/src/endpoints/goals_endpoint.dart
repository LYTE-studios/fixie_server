import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class GoalsEndpoint extends Endpoint {
  Future<int> addGoal(Session session, Goal goal) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message: "User could not be found. Are you authenticated?",
          errorType: ErrorType.authenticationError);
    } else {
      var newGoal = await Goal.db.insertRow(session, goal);
      var goalCheck = await Goal.db.findById(session, newGoal.id!);
      if (goalCheck == null) {
        return HttpStatus.notModified;
      } else {
        return HttpStatus.ok;
      }
    }
  }

  Future<Goal?> getGoal(Session session, int? goalId) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message: "User could not be found. Are you authenticated?",
          errorType: ErrorType.authenticationError);
    } else {
      var goal = await Goal.db.findById(session, goalId!);
      if (goal == null) {
        throw EndpointException(
            message: 'Goal not found', errorType: ErrorType.notFound);
      } else {
        return goal;
      }
    }
  }

  Future<List<Goal>?> getGoals(Session session) async {
    var user = await AuthUtils.getAuthenticatedUser(session);
    if (user == null) {
      throw EndpointException(
          message: 'User could not be found.',
          errorType: ErrorType.authenticationError);
    } else {
      var list = await Goal.db
          .find(session, where: (p0) => p0.userId.equals(user.userInfoId));
      return list;
    }
  }

  Future<Goal> updateGoal(Session session, Goal newGoal) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message: 'User could not be found.',
          errorType: ErrorType.authenticationError);
    } else {
      var goal = await Goal.db.findById(session, newGoal.id!);
      if (goal == null) {
        throw EndpointException(
            message: 'Goal could not be found', errorType: ErrorType.notFound);
      } else {
        return await Goal.db.updateRow(session, newGoal);
      }
    }
  }

  Future<int> deleteGoal(Session session, int goalId) async {
    if (await AuthUtils.getAuthenticatedUser(session) == null) {
      throw EndpointException(
          message: 'User could not be found.',
          errorType: ErrorType.authenticationError);
    } else {
      var goal = await Goal.db.findById(session, goalId);
      if (goal == null) {
        throw EndpointException(
            message: 'Goal not found', errorType: ErrorType.notFound);
      } else {
        var id = await Goal.db.deleteRow(session, goal);
        if (id == goalId) {
          return HttpStatus.ok;
        } else {
          throw EndpointException(
              message: "Goals don't match? Deleted goal's id: $id",
              errorType: ErrorType.databaseError);
        }
      }
    }
  }
}
