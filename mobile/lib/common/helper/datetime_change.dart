class DatetimeChange {
  DatetimeChange._();

  static DateTime getOpendate(DateTime start) {
    return DateTime(start.year, start.month, start.day, 0, 0, 0);
  }

  static DateTime getClosedate(DateTime end) {
    return DateTime(end.year, end.month, end.day, 23, 59, 59, 999);
  }

  static DateTime getDMYTime(DateTime time) {
    return DateTime(time.year, time.month, time.day);
  }

  static int getDuration(DateTime time1, DateTime time2) {
    return getDMYTime(time1).difference(getDMYTime(time2)).inDays;
  }
}
