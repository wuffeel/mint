import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mint/data/model/work_day_period/work_day_period.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import '../../domain/entity/specialist_work_info/specialist_work_info.dart';

@Injectable(as: Factory<SpecialistWorkInfo, SpecialistWorkInfoDto>)
class SpecialistWorkInfoFromDto
    implements Factory<SpecialistWorkInfo, SpecialistWorkInfoDto> {
  static const Map<String, int> _weekdayName = {
    'Monday': 1,
    'Tuesday': 2,
    'Wednesday': 3,
    'Thursday': 4,
    'Friday': 5,
    'Saturday': 6,
    'Sunday': 7,
  };

  /// Transforms given [workHours] values to a List<DateTime> with duration
  /// between workHours of [consultationMinutes]
  ///
  /// Also considers the situation where because of timezone differences
  /// work hours are extend to the next day => it will apply these work
  /// hours to it.
  ///
  /// Example:
  ///
  /// ```dart
  /// final workHours = {'Monday': {'start': '8:00 AM', 'end': '10:00 AM'}};
  /// final consultationMinutes = 60;
  ///
  /// _getWorkHours(workHours, consultationMinutes) =>
  ///
  /// (UTC+3 timezone)
  /// {'Monday':
  ///   [
  ///     1970-01-01 11:00:00.000,
  ///     1970-01-01 12:00:00.000,
  ///     1970-01-01 13:00:00.000,
  ///   ],
  /// }
  ///
  /// final extendedWorkHours = {'Monday': {'start: '8:00 PM', end: '10:00 PM'}}
  ///
  /// _getWorkHours(extendedWorkHours, consultationMinutes) =>
  /// (UTC+3 timezone)
  /// {
  ///  'Monday':
  ///   [
  ///     1970-01-01 23:00:00.000,
  ///   ],
  ///  'Tuesday':
  ///   [
  ///     1970-01-02 00:00:00.000,
  ///     1970-01-02 01:00:00.000,
  ///   ],
  /// }
  /// ```
  Map<String, List<DateTime>> _getWorkHours(
    Map<String, WorkDayPeriod> workHours,
    int consultationMinutes,
  ) {
    final result = <String, List<DateTime>>{};

    for (final workHour in workHours.entries) {
      final weekday = workHour.key;
      final timeData = workHour.value;
      final startOfWorkDay = timeData.start;
      final endOfWorkDay = timeData.end;
      if (startOfWorkDay == null || endOfWorkDay == null) continue;

      final startDateTime =
          DateFormat('h:mm a').parse(startOfWorkDay, true).toLocal();
      var endDateTime =
          DateFormat('h:mm a').parse(endOfWorkDay, true).toLocal();

      if (endDateTime.isBefore(startDateTime)) {
        endDateTime = endDateTime.add(const Duration(days: 1));
      }

      final workHoursList = _generateWorkHoursList(
        startDateTime,
        endDateTime,
        consultationMinutes,
      );

      if (endDateTime.day == startDateTime.day) {
        _addWorkHoursToResult(result, weekday, workHoursList);
      } else {
        _addWorkHoursToNextDay(
          result,
          weekday,
          workHoursList,
          endDateTime,
          consultationMinutes,
        );
        _addWorkHoursToResult(result, weekday, workHoursList);
      }
    }

    return result;
  }

  /// Generates a list of DateTime instances representing work hours between
  /// [startDateTime] and [endDateTime].
  List<DateTime> _generateWorkHoursList(
    DateTime startDateTime,
    DateTime endDateTime,
    int consultationMinutes,
  ) {
    final workHoursList = <DateTime>[];

    var currentHour = startDateTime;
    while (currentHour.isBefore(endDateTime) &&
        currentHour.day == startDateTime.day) {
      workHoursList.add(currentHour);

      currentHour = currentHour.add(
        Duration(minutes: consultationMinutes),
      );
    }

    return workHoursList;
  }

  /// Adds work hours to the [result] map for a specific weekday.
  void _addWorkHoursToResult(
    Map<String, List<DateTime>> result,
    String weekday,
    List<DateTime> workHoursList,
  ) {
    final dayList = result[weekday];
    if (dayList == null) {
      result[weekday] = workHoursList;
    } else {
      dayList.addAll(workHoursList);
      result[weekday] = dayList;
    }
  }

  /// Adds work hours to the next day of [result] map in case work hours
  /// extend beyond the current day.
  void _addWorkHoursToNextDay(
    Map<String, List<DateTime>> result,
    String weekday,
    List<DateTime> workHoursList,
    DateTime endDateTime,
    int consultationMinutes,
  ) {
    final nextDayWorkHours = <DateTime>[];
    var currentHour = workHoursList.last.add(
      Duration(minutes: consultationMinutes),
    );
    while (currentHour.isBefore(endDateTime)) {
      nextDayWorkHours.add(currentHour);
      currentHour = currentHour.add(
        Duration(minutes: consultationMinutes),
      );
    }

    final weekdayNum = _weekdayName[weekday];
    if (weekdayNum == null) return;

    var targetIndex = (weekdayNum + 1) % 7;
    if (targetIndex == 0) targetIndex = 7;

    final resultDay = _weekdayName.entries
        .singleWhere((entry) => entry.value == targetIndex)
        .key;

    final dayList = result[resultDay];
    if (dayList == null) {
      result[resultDay] = nextDayWorkHours;
    } else {
      result[resultDay] = [...nextDayWorkHours, ...dayList];
    }
  }

  @override
  SpecialistWorkInfo create(SpecialistWorkInfoDto param) {
    return SpecialistWorkInfo(
      bookingDaysAdvance: param.bookingDaysAdvance,
      consultationMinutes: param.consultationMinutes,
      specialistId: param.specialistId,
      excludedDays: [...param.excludedDays],
      workHours: _getWorkHours(param.workHours, param.consultationMinutes),
      bookedTimes: [...param.bookedTimes.map((e) => e.toLocal())],
    );
  }
}
