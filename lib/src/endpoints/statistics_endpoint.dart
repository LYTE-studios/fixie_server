import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:fixie_server/src/utils/auth_utils.dart';
import 'package:serverpod/serverpod.dart';

class StatisticsEndpoint extends Endpoint {
  Future<CategoryStatistics?> getStatisticsForCategory(
    Session session,
    Category category,
    DateTime start,
    DateTime end,
  ) async {
    await AuthUtils.getAuthenticatedUser(session);

    List<Goal> goals = await Goal.db.find(
      session,
      where: (t) => t.categoryId.equals(category.id),
    );

    // Set the empty statistics first
    CategoryStatistics statistics = CategoryStatistics(
      category: category,
      successRate: 0,
      currentSuccessRate: 0,
      bestStreak: 0,
      chartData: [],
    );

    double successRate = 0;
    double currentSuccessRate = 0;

    List<int> totalChartData = [];

    for (Goal goal in goals) {
      if ((goal.highestStreak ?? 0) > (statistics.bestStreak ?? 0)) {
        statistics.bestStreak = goal.highestStreak;
      }

      List<int> chartData = [];

      double totalUnits = 0;
      double currentTotalUnits = 0;

      double successUnits = 0;
      double currentSuccessUnits = 0;

      int daysCounted = (goal.created ?? DateTime.now())
          .difference(
            DateTime.now(),
          )
          .inDays;

      List<JournalLog> logs = await JournalLog.db.find(
        session,
        where: (t) => t.goalId.equals(goal.id),
      );

      for (int i = 0; i <= daysCounted; i++) {
        DateTime date = DateTime.now().subtract(
          Duration(days: daysCounted - i),
        );

        JournalLog? log = logs.firstWhereOrNull(
          (e) =>
              e.date.year == date.year &&
              e.date.month == date.month &&
              e.date.day == date.day,
        );

        totalUnits += goal.target;
        successUnits += (log?.loggedValue ?? 0).toInt();

        if (date.isAfter(start) && date.isBefore(end)) {
          currentTotalUnits += goal.target;
          successUnits += (log?.loggedValue ?? 0).toInt();

          chartData.add(
            (((log?.loggedValue ?? 0).toInt() / goal.target) * 100).toInt(),
          );
        }
      }

      successRate = (successRate + (successUnits / totalUnits)) / 2;
      currentSuccessRate =
          (currentSuccessRate + (currentSuccessUnits / currentTotalUnits)) / 2;

      for (int i = 0; i < chartData.length; i++) {
        if (totalChartData.length > i) {
          totalChartData[i] = (totalChartData[i] + chartData[i]) ~/ 2;
        } else {
          totalChartData.add(chartData[i]);
        }
      }
    }

    statistics.chartData = totalChartData;
    statistics.successRate = successRate;
    statistics.currentSuccessRate = currentSuccessRate;

    return statistics;
  }
}
