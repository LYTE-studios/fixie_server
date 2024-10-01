import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:fixie_server/src/utils/date_time_utils.dart';
import 'package:sentry/sentry.dart';
import 'package:serverpod/serverpod.dart';

class StatisticsEndpoint extends Endpoint {
  Future<GoalStatistics?> getStatisticsForGoal(
    Session session,
    Goal goal,
  ) async {
    await AuthUtils.getAuthenticatedUser(session);

    GoalStatistics statistics = GoalStatistics(
      goal: goal,
      total: 0,
      loggedDays: {},
    );

    List<JournalLog> logs = await JournalLog.db.find(
      session,
      include: JournalLog.include(
        goal: Goal.include(),
      ),
      where: (t) => t.goalId.equals(goal.id),
    );

    for (JournalLog log in logs) {
      double value = log.loggedValue ?? 0;

      statistics.loggedDays[log.date] = value / (log.goal?.target ?? 1);
      statistics.total += value;
    }

    return statistics;
  }

  Future<Statistics?> getMonthlyJournalStatistics(
    Session session,
    Category? category,
    Goal? goal,
    DateTime month,
  ) async {
    User user = await AuthUtils.getAuthenticatedUser(session);

    List<Goal> goals = [];

    ISentrySpan span = Sentry.startTransaction(
      'Load user statistics',
      'getMonthlyJournalStatistics',
      startTimestamp: DateTime.now(),
      autoFinishAfter: Duration(seconds: 20),
    );

    try {
      if (goal?.id != null) {
        goals = await Goal.db.find(
          session,
          where: (t) => t.id.equals(goal?.id) & t.archived.notEquals(true),
        );
      } else if (category?.id != null) {
        goals = await Goal.db.find(
          session,
          where: (t) =>
              t.categoryId.equals(category?.id) & t.archived.notEquals(true),
        );
      } else {
        goals = await Goal.db.find(
          session,
          where: (t) => t.userId.equals(user.id) & t.archived.notEquals(true),
        );
      }
    } catch (e) {
      Sentry.captureException(e);

      // Return empty statistics for non-loaded goals
      return Statistics(
        monthlySuccessRate: 0,
        monthlySuccessRateTrend: 0,
        yearlySuccessRate: 0,
        yearlySuccessRateTrend: 0,
        yearlyGoalsCompleted: 0,
        monthlyGoalsCompleted: 0,
        monthlyGoalsCompletedTrend: 0,
        bestStreak: 0,
        bestCurrentStreak: 0,
        monthChartData: {},
      );
    }

    List<Statistics> statisticsList = [];

    double getMean(List<double> doubles) {
      if (doubles.isEmpty) {
        return 0;
      }

      double total = 0;
      for (double value in doubles) {
        total += value;
      }

      return total / doubles.length;
    }

    int getAddition(List<int> doubles) {
      if (doubles.isEmpty) {
        return 0;
      }

      int total = 0;

      for (int value in doubles) {
        total += value;
      }

      return total;
    }

    int getHighest(List<int> doubles) {
      if (doubles.isEmpty) {
        return 0;
      }

      int highest = 0;

      for (int value in doubles) {
        if (value > highest) {
          highest = value;
        }
      }

      return highest;
    }

    try {
      for (Goal goal in goals) {
        // Set the empty statistics first
        Statistics statistics = Statistics(
          monthlySuccessRate: 0,
          monthlySuccessRateTrend: 0,
          yearlySuccessRate: 0,
          yearlySuccessRateTrend: 0,
          yearlyGoalsCompleted: 0,
          monthlyGoalsCompleted: 0,
          monthlyGoalsCompletedTrend: 0,
          bestStreak: 0,
          bestCurrentStreak: 0,
          monthChartData: {},
        );

        DateTime now = DateTime(month.year, month.month + 1).subtract(
          Duration(
            minutes: 1,
          ),
        );

        if (now.isAfter(DateTime.now())) {
          now = DateTime(
            DateTime.now().year,
            DateTime.now().month,
            DateTime.now().day,
          ).add(
            Duration(
              days: 1,
            ),
          );
        }

        DateTime startOfYear = DateTime(
          now.year,
        );

        DateTime startOfMonth = DateTime(
          now.year,
          now.month,
        );

        DateTime thisYear = (goal.created?.isAfter(startOfYear) ?? false)
            ? DateTime(
                goal.created!.year,
                goal.created!.month,
                goal.created!.day,
              )
            : startOfYear;

        DateTime lastYear = DateTime(now.year - 1);
        DateTime lastMonth = DateTime(now.year, now.month - 1);

        DateTime thisMonth = (goal.created?.isAfter(startOfMonth) ?? false)
            ? DateTime(
                goal.created!.year,
                goal.created!.month,
                goal.created!.day,
              )
            : startOfMonth;

        int daysThisYear = now.difference(thisYear).inDays;

        int daysThisMonth = now.difference(thisMonth).inDays;

        List<JournalLog> logs = await JournalLog.db.find(
          session,
          where: (t) =>
              t.goalId.inSet(
                goals.map((e) => e.id ?? 0).toSet(),
              ) &
              t.date.between(
                DateTime(
                  now.year - 1,
                ),
                now,
              ),
        );

        Map<int, List<double>> monthlyChartRates = {};

        int yearlyGoalsCompleted = 0;

        int monthlyGoalsCompleted = 0;
        int monthlyGoalsCompletedTrend = 0;

        int bestStreak = 0;
        int bestCurrentStreak = 0;

        double yearlyTotal = 1;
        double yearly = 0;

        double yearlyTrend = 0;

        double monthlyTotal = 1;
        double monthly = 0;

        double monthlyTrend = 0;

        switch (goal.repetition) {
          case Repetition.Daily:
            {
              yearlyTotal = ((goal.weekdays?.length ?? 0) / 7) *
                  goal.target *
                  daysThisYear;
              monthlyTotal = ((goal.weekdays?.length ?? 0) / 7) *
                  goal.target *
                  daysThisMonth;

              JournalLog? log = logs.firstWhereOrNull(
                (e) =>
                    e.date.year == now.year &&
                    e.date.month == now.month &&
                    e.date.day == now.day,
              );
              if ((log?.currentStreak ?? 0) > bestCurrentStreak) {
                bestCurrentStreak = log?.currentStreak ?? 0;
              }
            }
          case Repetition.Weekly:
            {
              yearlyTotal = (goal.target * daysThisYear) / 7;
              monthlyTotal = (goal.target * daysThisMonth) / 7;

              JournalLog? log = logs.firstWhereOrNull(
                (e) =>
                    e.date.year == now.year &&
                    DateTimeUtils.weekNumber(e.date) ==
                        DateTimeUtils.weekNumber(now),
              );
              if ((log?.currentStreak ?? 0) > bestCurrentStreak) {
                bestCurrentStreak = log?.currentStreak ?? 0;
              }
            }
          case Repetition.Monthly:
            {
              yearlyTotal = (goal.target * now.month).toDouble();
              monthlyTotal = goal.target.toDouble();

              JournalLog? log = logs.firstWhereOrNull(
                (e) => e.date.year == now.year && e.date.month == now.month,
              );
              if ((log?.currentStreak ?? 0) > bestCurrentStreak) {
                bestCurrentStreak = log?.currentStreak ?? 0;
              }
            }
          case Repetition.Yearly:
            {
              yearlyTotal = goal.target.toDouble();
              monthlyTotal = (goal.target / 12).toDouble();

              JournalLog? log = logs.firstWhereOrNull(
                (e) => e.date.year == now.year,
              );
              if ((log?.currentStreak ?? 0) > bestCurrentStreak) {
                bestCurrentStreak = log?.currentStreak ?? 0;
              }
            }
          case null:
        }

        Iterable<JournalLog> goalLogs = logs.where(
          (log) => log.goalId == goal.id,
        );

        for (JournalLog log in goalLogs) {
          if ((log.currentStreak ?? 0) > bestStreak) {
            bestStreak = log.currentStreak ?? 0;
          }
          if (log.date.isAfter(lastYear) && log.date.isBefore(startOfYear)) {
            yearlyTrend += log.loggedValue ?? 0;
          }
          if (log.date.isAfter(lastMonth) && log.date.isBefore(startOfMonth)) {
            if ((log.loggedValue ?? 0) >= (log.goal?.target.toDouble() ?? 0)) {
              monthlyGoalsCompletedTrend += 1;
            }

            monthlyTrend += log.loggedValue ?? 0;
          }
          if (log.date.isAfter(startOfYear) && log.date.isBefore(month)) {
            if ((log.loggedValue ?? 0) >= (log.goal?.target.toDouble() ?? 0)) {
              yearlyGoalsCompleted += 1;
            }

            yearly += log.loggedValue ?? 0;
          }
          if (log.date.isAfter(startOfMonth) && log.date.isBefore(month)) {
            if ((log.loggedValue ?? 0) >= (log.goal?.target.toDouble() ?? 0)) {
              monthlyGoalsCompleted += 1;
            }

            monthlyChartRates[log.date.day] ??= [];
            monthlyChartRates[log.date.day]!.add(log.loggedValue ?? 0);

            monthly += log.loggedValue ?? 0;
          }
        }

        for (int i = 1;
            i <= DateTime(month.year, month.month + 1, 0).day;
            i++) {
          statistics.monthChartData[i] = getMean(monthlyChartRates[i] ?? []);
        }

        statistics.yearlySuccessRate = yearly / yearlyTotal;
        statistics.monthlySuccessRate = monthly / monthlyTotal;

        statistics.yearlySuccessRateTrend =
            statistics.yearlySuccessRate - (yearlyTrend / yearlyTotal);
        statistics.monthlySuccessRateTrend =
            statistics.monthlySuccessRate - (monthlyTrend / monthlyTotal);

        statistics.monthlyGoalsCompleted = monthlyGoalsCompleted;
        statistics.monthlyGoalsCompletedTrend =
            monthlyGoalsCompleted - monthlyGoalsCompletedTrend;
        statistics.yearlyGoalsCompleted = yearlyGoalsCompleted;

        statistics.bestStreak = bestStreak;
        statistics.bestCurrentStreak = bestCurrentStreak;

        statisticsList.add(statistics);
      }

      Map<int, double>? joinedChart =
          statisticsList.map((e) => e.monthChartData).firstOrNull;

      if (joinedChart != null) {
        for (int value in joinedChart.keys) {
          joinedChart[value] = getMean(
              statisticsList.map((e) => e.monthChartData[value] ?? 0).toList());
        }
      }

      Statistics totalStatistics = Statistics(
        monthlySuccessRate: getMean(
          statisticsList.map((e) => e.monthlySuccessRate).toList(),
        ),
        monthlySuccessRateTrend: getMean(
          statisticsList.map((e) => e.monthlySuccessRateTrend).toList(),
        ),
        yearlySuccessRate: getMean(
          statisticsList.map((e) => e.yearlySuccessRate).toList(),
        ),
        yearlySuccessRateTrend: getMean(
          statisticsList.map((e) => e.yearlySuccessRateTrend).toList(),
        ),
        yearlyGoalsCompleted: getAddition(
          statisticsList.map((e) => e.yearlyGoalsCompleted).toList(),
        ),
        monthlyGoalsCompleted: getAddition(
          statisticsList.map((e) => e.monthlyGoalsCompleted).toList(),
        ),
        monthlyGoalsCompletedTrend: getAddition(
          statisticsList.map((e) => e.monthlyGoalsCompletedTrend).toList(),
        ),
        bestStreak: getHighest(
          statisticsList.map((e) => e.bestStreak).toList(),
        ),
        bestCurrentStreak: getHighest(
          statisticsList.map((e) => e.bestCurrentStreak).toList(),
        ),
        monthChartData: joinedChart ?? {},
      );

      span.finish();
      return totalStatistics;
    } catch (e) {
      span.finish(
        status: SpanStatus.internalError(),
        endTimestamp: DateTime.now(),
      );

      Sentry.captureException(e);
      rethrow;
    }
  }
}
