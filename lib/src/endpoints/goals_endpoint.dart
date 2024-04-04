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
      user.goals?.add(newGoal);
      var updatedUser = await User.db.updateRow(session, user);
      var goalCheck = updatedUser.goals?.firstWhere(
          (element) => element.id?.compareTo(newGoal.id as num) == 0);
      if (goalCheck != null) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      throw Exception("User can't be null.");
    }
  }

  Future<Goal> getGoal(Session session, int? goalId) async {
    Goal? goal;
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(session,
        where: (t) => t.userInfoId.equals(authenticatedUserId));
    if (user != null) {
      if (user.goals != null && user.goals?.isNotEmpty == true) {
        goal = user.goals?.firstWhere(
            (element) => element.id?.compareTo(goalId as num) == 0);
        if (goal == null) {
          throw Exception("Could not find goal");
        }
      }
    }
    return goal!;
  }

  Future<List<Goal>?> getGoals(Session session) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authenticatedUserId),
    );
    if (user != null) {
      var list = user.goals;
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

  //Method to create Goal
  Goal createGoal(
      String title,
      String? picture,
      int target,
      TargetPeriod targetPeriod,
      Category category,
      Repetition repetition,
      List<Days>? days) {
    Goal goal = Goal(
        title: title,
        picture: picture ?? '',
        target: target,
        targetPeriod: targetPeriod,
        category: category,
        repetition: repetition,
        days: days ?? []);
    return goal;
  }

  bool areListsEqual(List<Days> list1, List<Days> list2) {
    final set1 = Set.from(list1);
    final set2 = Set.from(list2);
    return set1.length == set2.length && set1.containsAll(set2);
  }
}
