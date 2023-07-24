import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mint/assembly/factory.dart';

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
  /// ```
  Map<String, List<DateTime>> _getWorkHours(
    Map<String, dynamic> workHours,
    int consultationMinutes,
  ) {
    final result = <String, List<DateTime>>{};

    workHours.forEach((day, timeData) {
      if (timeData != null && timeData is Map) {
        final startTime = timeData['start'] as String?;
        final endTime = timeData['end'] as String?;

        if (startTime != null && endTime != null) {
          final startDateTime =
              DateFormat('h:mm a').parse(startTime, true).toLocal();
          var endDateTime = DateFormat('h:mm a').parse(endTime, true).toLocal();

          if (endDateTime.isBefore(startDateTime)) {
            endDateTime = endDateTime.add(const Duration(days: 1));
          }

          final workHoursList = <DateTime>[];

          // Generate the List<DateTime> representing the work hours for the day
          var currentHour = startDateTime;
          while (currentHour.isBefore(endDateTime) &&
              currentHour.day == startDateTime.day) {
            workHoursList.add(currentHour);

            currentHour = currentHour.add(
              Duration(minutes: consultationMinutes),
            );
          }

          // If the work hours extend to the next day, add the next day's hours
          // to the result
          if (endDateTime.day > startDateTime.day) {
            final nextDayWorkHours = <DateTime>[];
            while (currentHour.isBefore(endDateTime)) {
              nextDayWorkHours.add(currentHour);
              currentHour = currentHour.add(
                Duration(minutes: consultationMinutes),
              );
            }

            final weekdayNum = _weekdayName[day];
            if (weekdayNum != null) {
              var targetIndex = (weekdayNum + 1) % 7;

              if (targetIndex == 0) {
                targetIndex = 7;
              }

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
          }

          final dayList = result[day];
          if (dayList == null) {
            result[day] = workHoursList;
          } else {
            dayList.addAll(workHoursList);
            result[day] = dayList;
          }
        }
      }
    });

    return result;
  }

  @override
  SpecialistWorkInfo create(SpecialistWorkInfoDto param) {
    return SpecialistWorkInfo(
      bookingDaysAdvance: param.bookingDaysAdvance,
      consultationMinutes: param.consultationMinutes,
      specialistId: param.specialistId,
      excludedDays: [...param.excludedDays],
      workHours: _getWorkHours(
        Map<String, dynamic>.from(param.workHours as Map),
        param.consultationMinutes,
      ),
      bookedTimes: [...param.bookedTimes.map((e) => e.toLocal())],
    );
  }
}
