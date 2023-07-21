import 'package:table_calendar/table_calendar.dart';

class CalendarUtils {
  /// Checks if the whole day was booked
  ///
  /// Returns:
  /// - 'true' if every available consultation time from [daySchedule] on given
  /// [day] is booked in [bookedTimes]
  /// - 'false' otherwise
  ///
  /// Example:
  /// ```dart
  /// final day = 2023-01-01 00:00:00.000;
  /// final daySchedule = [1970-01-01 08:00:00, 1970-01-01 09:00:00];
  /// final fullyBookedDay = [2023-01-01 08:00:00, 2023-01-01 09:00:00]
  /// final partlyBookedDay = [2023-01-01 08:00:00];
  ///
  /// isDayFullyBooked(day, fullyBookedDay, daySchedule) => true;
  /// isDayFullyBooked(day, partlyBookedDay, daySchedule) => false;
  /// ```
  static bool isDayFullyBooked(
    DateTime day,
    List<DateTime> bookedTimes,
    List<DateTime> daySchedule,
  ) {
    if (bookedTimes.isEmpty || daySchedule.isEmpty) return false;

    final dayBooks =
        bookedTimes.where((element) => isSameDay(element, day)).toList();
    if (dayBooks.isEmpty) return false;

    final isBooked = daySchedule.every((workTime) {
      final currentDayWorkTime = DateTime(
        day.year,
        day.month,
        day.day,
        workTime.hour,
        workTime.minute,
        workTime.second,
      );
      final isBetween = currentDayWorkTime.isAfter(dayBooks.first) &&
          currentDayWorkTime.isBefore(dayBooks.last);
      final isFirst = currentDayWorkTime == dayBooks.first;
      final isLast = currentDayWorkTime == dayBooks.last;
      return isBetween || isFirst || isLast;
    });

    return isBooked;
  }

  /// Checks if the current time has passed the specified [workDayEnd].
  ///
  /// Returns:
  /// - `true` if the current time is after the [workDayEnd] and is not
  /// before [day].
  /// - `false` otherwise.
  ///
  /// Example:
  /// ```dart
  /// DateTime currentDate = DateTime(2023, 7, 21, 18, 0); // 6:00 PM
  /// DateTime workDayEnd = DateTime(2023, 7, 21, 17, 30); // 5:30 PM
  /// DateTime day = DateTime(2023, 7, 21); // July 21, 2023
  ///
  /// bool isEnd = isWorkTimeEnd(day, workDayEnd, currentDate); // true
  /// ```
  static bool isWorkTimeEnd(DateTime day, DateTime? workDayEnd) {
    final currentDate = DateTime.now();
    if (workDayEnd == null || currentDate.isBefore(day)) return false;
    final currentTimeForDay = DateTime(
      day.year,
      day.month,
      day.day,
      currentDate.hour,
      currentDate.minute,
      currentDate.second,
    );
    return currentTimeForDay.isAfter(
      DateTime(
        day.year,
        day.month,
        day.day,
        workDayEnd.hour,
        workDayEnd.minute,
        workDayEnd.second,
      ),
    );
  }

  /// Checks if the given [time] is unavailable for booking on [selectedDate].
  ///
  /// Returns:
  /// - `true` if [time] is before the current time or if it exists in
  /// [bookedTimes].
  /// - `false` otherwise, indicating that [time] is available for booking.
  ///
  /// Example:
  /// ```dart
  /// final selectedDate = DateTime(2023, 7, 21); // July 21, 2023
  /// final time = DateTime(2023, 7, 21, 10, 0); // 10:00 AM
  /// final bookedTimes = [DateTime(2023, 7, 21, 10, 0),
  /// DateTime(2023, 7, 21, 14, 0)];
  ///
  /// isTimeUnavailable(selectedDate, time, bookedTimes) => true
  /// ```
  static bool isTimeUnavailable(
    DateTime time,
    DateTime selectedDate,
    List<DateTime> bookedTimes,
  ) {
    final timeForCurrentDay = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      time.hour,
      time.minute,
      time.second,
    );
    final now = DateTime.now();
    final isTimeBeforeCurrent = timeForCurrentDay.isBefore(now);
    return bookedTimes.contains(timeForCurrentDay) || isTimeBeforeCurrent;
  }
}