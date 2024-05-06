import 'dart:ffi';
import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class GoalsEndpoint extends Endpoint {
  Future<int> addGoal(Session session, Goal goal) async {
    if (await AuthUtils.getAuthenticatedUser(session) != null) {
      var newGoal = await Goal.db.insertRow(session, goal);
      var goalCheck = await Goal.db.findById(session, newGoal.id!);
      if (goalCheck != null) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      return HttpStatus.notFound;
    }
  }

  Future<Goal?> getGoal(Session session, int? goalId) async {
    if (await AuthUtils.getAuthenticatedUser(session) != null) {
      var goal = await Goal.db.findById(session, goalId!);
      if (goal == null) {
        throw EndpointException(
            message: 'Goal not found', errorType: ErrorType.notFound);
      } else {
        return goal;
      }
    }
    return null;
  }

  Future<List<Goal>?> getGoals(Session session) async {
    var user = await AuthUtils.getAuthenticatedUser(session);
    if (user != null) {
      var list = await Goal.db
          .find(session, where: (p0) => p0.userId.equals(user.userInfoId));
      return list;
    } else {
      throw EndpointException(
          message: 'User could not be found.', errorType: ErrorType.notFound);
    }
  }

  Future<int> updateGoal(Session session, int goalId, Goal newGoal) async {
    if (await AuthUtils.getAuthenticatedUser(session) != null) {
      var goal = await Goal.db.findById(session, goalId);
      if (goal != null) {
        goal.title = newGoal.title;
        goal.picture = newGoal.picture;
        goal.target = newGoal.target;
        goal.targetPeriod = newGoal.targetPeriod;
        goal.category = newGoal.category;
        goal.repetition = newGoal.repetition;
        goal.days = newGoal.days;
        var updatedGoal = await Goal.db.updateRow(session, goal);
        if (updatedGoal.title == goal.title ||
            updatedGoal.userId == goal.userId ||
            updatedGoal.picture == goal.picture ||
            updatedGoal.target == goal.target ||
            updatedGoal.targetPeriod == goal.targetPeriod ||
            updatedGoal.category == goal.category ||
            updatedGoal.repetition == goal.repetition ||
            areListsEqual(goal.days!, updatedGoal.days!)) {
          return HttpStatus.ok;
        } else {
          return HttpStatus.notModified;
        }
      } else {
        throw EndpointException(
            message: 'Goal could not be found', errorType: ErrorType.notFound);
      }
    } else {
      throw EndpointException(
          message: 'User could not be found.', errorType: ErrorType.notFound);
    }
  }

  Future<int> deleteGoal(Session session, int goalId) async {
    if (await AuthUtils.getAuthenticatedUser(session) != null) {
      var goal = await Goal.db.findById(session, goalId);
      if (goal != null) {
        var id = await Goal.db.deleteRow(session, goal);
        if (id == goalId) {
          return HttpStatus.ok;
        } else {
          throw EndpointException(
              message: "Goals don't match? Deleted goal's id: $id",
              errorType: ErrorType.databaseError);
        }
      } else {
        throw EndpointException(
            message: 'Goal not found', errorType: ErrorType.notFound);
      }
    } else {
      throw EndpointException(
          message: 'User could not be found.', errorType: ErrorType.notFound);
    }
  }

  bool areListsEqual(List<Days> list1, List<Days> list2) {
    final set1 = Set.from(list1);
    final set2 = Set.from(list2);
    return set1.length == set2.length && set1.containsAll(set2);
  }
}
