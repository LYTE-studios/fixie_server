import 'dart:ffi';
import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart';

class GoalsEndpoint extends Endpoint {
  Future<int> addGoal(Session session, Goal goal) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authenticatedUserId),
    );
    if (user != null) {
      var newGoal = await Goal.db.insertRow(session, goal);
      var goalCheck = await Goal.db.findById(session, newGoal.id!);
      if (goalCheck != null) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      throw Exception("User can't be null.");
    }
  }

  Future<Goal?> getGoal(Session session, int? goalId) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(session,
        where: (t) => t.userInfoId.equals(authenticatedUserId));
    if (user != null) {
      var goal = await Goal.db.findById(session, goalId!);
      if (goal == null) {
        throw Exception("Could not find goal");
      } else {
        return goal;
      }
    }
    return null;
  }

  Future<List<Goal>?> getGoals(Session session) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authenticatedUserId),
    );
    if (user != null) {
      var list = await Goal.db
          .find(session, where: (p0) => p0.userId.equals(authenticatedUserId));
      return list;
    } else {
      throw Exception("User can't be null.");
    }
  }

  Future<int> updateGoal(Session session, int goalId, Goal newGoal) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authenticatedUserId),
    );
    if (user != null) {
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
        throw Exception("Goal could not be found");
      }
    } else {
      throw Exception("User can't be null.");
    }
  }

  bool areListsEqual(List<Days> list1, List<Days> list2) {
    final set1 = Set.from(list1);
    final set2 = Set.from(list2);
    return set1.length == set2.length && set1.containsAll(set2);
  }
}
