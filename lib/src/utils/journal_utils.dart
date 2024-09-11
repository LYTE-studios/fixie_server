import 'package:collection/collection.dart';
import 'package:fixie_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class JournalUtils {
  static Future<JournalLog?> setStreakValues(
    Session session,
    JournalLog log,
  ) async {
    if (log.goal == null) {
      return log;
    }

    List<JournalLog> logs = await JournalLog.db.find(
      session,
      include: JournalLog.include(
        goal: Goal.include(),
      ),
      where: (t) => t.goalId.equals(log.goal!.id),
    );

    int daysCounted = DateTime.now()
        .difference(
          log.goal!.created!,
        )
        .inDays;

    int currentStreak = 0;
    int topStreak = 0;

    for (int i = 0; i <= daysCounted; i++) {
      DateTime date = DateTime.now().subtract(
        Duration(days: daysCounted - i),
      );

      JournalLog? nowLog = logs.firstWhereOrNull(
        (e) =>
            e.date.year == date.year &&
            e.date.month == date.month &&
            e.date.day == date.day,
      );

      if ((nowLog?.loggedValue ?? 0) >= log.goal!.target) {
        currentStreak += 1;
        if (currentStreak > topStreak) {
          topStreak = currentStreak;
        }
      } else {
        currentStreak = 0;
      }
    }

    log.goal!.highestStreak = topStreak;

    await Goal.db.updateRow(session, log.goal!);

    return await JournalLog.db.findById(
      session,
      log.id!,
      include: JournalLog.include(
        goal: Goal.include(
          category: Category.include(),
        ),
      ),
    );
  }
}
