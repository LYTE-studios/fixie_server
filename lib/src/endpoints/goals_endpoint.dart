import 'dart:io';

import 'package:fixie_server/src/endpoints/categories_endpoint.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class GoalsEndpoint extends Endpoint {
  Future<int> addGoal(Session session, CreateGoalDto dto) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    await Goal.db.insertRow(
      session,
      Goal(
        title: dto.title,
        userId: user.id!,
        target: dto.target,
        categoryId: dto.category!.id!,
        setRemind: dto.setRemind,
        active: true,
        archived: false,
        picture: dto.picture,
        unit: dto.unit,
        days: dto.days,
        end: dto.end,
        remindMinutes: dto.remindMinutes,
        remindHour: dto.remindHour,
        remindHalf: dto.remindHalf,
        remindTimezone: dto.remindTimezone,
      ),
    );

    return HttpStatus.ok;
  }

  Future<Goal?> getGoal(Session session, int? goalId) async {
    await AuthUtils.getAuthenticatedUser(session);

    var goal = await Goal.db.findById(session, goalId!);

    if (goal == null) {
      throw EndpointException(
        message: 'Goal not found',
        errorType: ErrorType.notFound,
      );
    }

    return goal;
  }

  Future<List<Goal>?> getGoals(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<Goal> list = await Goal.db.find(
      session,
      where: (p0) => p0.userId.equals(user.id),
    );

    return list;
  }

  Future<Goal> updateGoal(Session session, Goal newGoal) async {
    await AuthUtils.getAuthenticatedUser(session);

    var goal = await Goal.db.findById(session, newGoal.id!);

    if (goal == null) {
      throw EndpointException(
        message: 'Goal could not be found',
        errorType: ErrorType.notFound,
      );
    }

    return await Goal.db.updateRow(session, newGoal);
  }

  Future<int> deleteGoal(Session session, int goalId) async {
    await AuthUtils.getAuthenticatedUser(session);

    Goal? goal = await Goal.db.findById(session, goalId);

    if (goal == null) {
      throw EndpointException(
        message: 'Goal not found',
        errorType: ErrorType.notFound,
      );
    }

    Goal deletedGoal = await Goal.db.deleteRow(session, goal);

    if (deletedGoal.id == goalId) {
      return HttpStatus.ok;
    }

    throw EndpointException(
      message: "Goals don't match? Deleted goal's id: ${deletedGoal.id}",
      errorType: ErrorType.databaseError,
    );
  }
}
