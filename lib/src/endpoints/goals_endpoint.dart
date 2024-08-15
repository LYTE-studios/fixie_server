import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class GoalsEndpoint extends Endpoint {
  Future<Goal> addGoal(Session session, CreateGoalDto dto) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    if (dto.category == null) {
      throw EndpointException(
        errorType: ErrorType.invalidInput,
        message: 'Please provide a goal category!',
      );
    }

    Goal goal = await Goal.db.insertRow(
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
        end: dto.end,
        remindMinutes: dto.remindMinutes,
        remindHour: dto.remindHour,
        remindHalf: dto.remindHalf,
        remindTimezone: dto.remindTimezone,
        created: DateTime.now(),
      ),
    );

    if (dto.days != null) {
      addRepeatsForGoal(
        session,
        goalId: goal.id!,
        days: dto.days!,
      );
    }

    return goal;
  }

  Future<int> addRepeatsForGoal(
    Session session, {
    required int goalId,
    required List<RepeatableDays> days,
  }) async {
    await AuthUtils.getAuthenticatedUser(session);

    List<RepeatableDays> newDays = [];

    for (RepeatableDays day in days) {
      newDays.add(
        RepeatableDays(
          day: day.day,
          extraInfo: day.extraInfo,
          goalId: goalId,
        ),
      );
    }

    await RepeatableDays.db.insert(
      session,
      newDays,
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
      include: Goal.include(
        category: Category.include(),
      ),
      where: (p0) => p0.userId.equals(user.id) & p0.archived.notEquals(true),
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

  Future<void> resetGoals(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<Goal> goals = await Goal.db.find(
      session,
      where: (t) => t.userId.equals(
        user.id,
      ),
    );

    for (Goal goal in goals) {
      goal.archived = true;

      Goal.db.updateRow(session, goal);
    }
  }
}
