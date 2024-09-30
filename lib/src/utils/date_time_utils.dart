import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Calculates number of weeks for a given year as per https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year
  static int numOfWeeks(int year) {
    DateTime dec28 = DateTime(year, 12, 28);
    int dayOfDec28 = int.parse(DateFormat("D").format(dec28));
    return ((dayOfDec28 - dec28.weekday + 10) / 7).floor();
  }

  /// Calculates week number from a date as per https://en.wikipedia.org/wiki/ISO_week_date#Calculation
  static int weekNumber(DateTime date) {
    int dayOfYear = int.parse(DateFormat("D").format(date));
    int woy = ((dayOfYear - date.weekday + 10) / 7).floor();
    if (woy < 1) {
      woy = numOfWeeks(date.year - 1);
    } else if (woy > numOfWeeks(date.year)) {
      woy = 1;
    }
    return woy;
  }

  static String formatDate(DateTime date) {
    return '${date.day}-${date.month}-${date.year}';
  }

  static String formatWeekday(int day) {
    switch (day) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
    }

    return '';
  }

  static DateTime toStartOfDay(
    DateTime dateTime,
  ) {
    return DateTime.utc(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      0,
      0,
    );
  }

  static DateTime toEndOfDay(
    DateTime dateTime,
  ) {
    return DateTime.utc(
      dateTime.year,
      dateTime.month,
      dateTime.day,
      23,
      59,
    );
  }
}
