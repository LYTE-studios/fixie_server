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
      int? goalLength = user.goals?.length;
      user.goals?.add(goal);
      var updatedUser = await User.db.updateRow(session, user);
      var updatedLength = updatedUser.goals?.length;
      if (updatedLength != null && updatedLength == goalLength) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      throw Exception("Goal can't be null.");
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

  Future<int> editGoal(Session session, Goal goal) async {
    int? authenticatedUserId = await session.auth.authenticatedUserId;
    User? user = await User.db.findFirstRow(
      session,
      where: (t) => t.userInfoId.equals(authenticatedUserId),
    );
    if (user != null) {
      var len = user.goals?.length;
      var goalToUpdate = user.goals
          ?.firstWhere((element) => element.id?.compareTo(goal.id as num) == 0);
      user.goals?.remove(goalToUpdate);
      user.goals?.add(goal);
      var updatedUser = await User.db.updateRow(session, user);
      var updatedLength = updatedUser.goals?.length;
      if (updatedLength != null && updatedLength == len) {
        return HttpStatus.ok;
      } else {
        return HttpStatus.notModified;
      }
    } else {
      throw Exception("Goal can't be null.");
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
}
