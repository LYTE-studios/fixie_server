import 'dart:io';

import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/managers/goal_manager.dart';
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
        repetition: dto.repetition,
        reminders: dto.reminders,
        weekdays: dto.weekdays,
        active: true,
        archived: false,
        picture: dto.picture,
        unit: dto.unit,
        end: dto.end,
        created: DateTime.now(),
      ),
    );

    goal.user = user;

    GoalManager.scheduleCurrentNotification(
      session,
      goal,
    );

    return goal;
  }

  Future<Goal?> getGoal(Session session, int? goalId) async {
    await AuthUtils.getAuthenticatedUser(session);

    var goal = await Goal.db.findById(
      session,
      goalId!,
      include: Goal.include(
        category: Category.include(),
      ),
    );

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

  Future<Goal> updateGoal(
    Session session,
    int goalId,
    CreateGoalDto newGoal,
  ) async {
    await AuthUtils.getAuthenticatedUser(session);

    var goal = await Goal.db.findById(session, goalId);

    if (goal == null) {
      throw EndpointException(
        message: 'Goal could not be found',
        errorType: ErrorType.notFound,
      );
    }

    goal.title = newGoal.title;
    goal.target = newGoal.target;
    goal.unit = newGoal.unit;
    goal.end = newGoal.end;
    goal.reminders = newGoal.reminders;
    goal.weekdays = newGoal.weekdays;
    goal.repetition = newGoal.repetition;
    goal.picture = newGoal.picture;
    goal.category = newGoal.category;
    goal.categoryId = newGoal.category!.id!;

    return await Goal.db.updateRow(session, goal);
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

    goal.archived = true;

    Goal deletedGoal = await Goal.db.updateRow(session, goal);

    if (deletedGoal.id == goalId) {
      return HttpStatus.ok;
    }

    throw EndpointException(
      message: "Goals don't match? Deleted goal's id: ${deletedGoal.id}",
      errorType: ErrorType.databaseError,
    );
  }

  Future<void> permanentlyDeleteAllGoals(Session session) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<Goal> goals = await Goal.db.find(
      session,
      where: (t) => t.userId.equals(
        user.id,
      ),
    );

    for (Goal goal in goals) {
      Goal.db.deleteRow(session, goal);
    }
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
