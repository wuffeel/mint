import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mint/assembly/factory.dart';

import '../../data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import '../../domain/entity/specialist_work_info/specialist_work_info.dart';

@Injectable(as: Factory<SpecialistWorkInfo, SpecialistWorkInfoDto>)
class SpecialistWorkInfoFromDto
    implements Factory<SpecialistWorkInfo, SpecialistWorkInfoDto> {
  /// Transforms given [workHours] values to a List<DateTime> with duration
  /// between workHours of [consultationMinutes]
  ///
  /// Example:
  ///
  /// ```dart
  /// UTC+0 timezone:
  /// final workHours = {'Monday': {'start': '8:00 AM', 'end': '10:00 AM'}};
  /// final consultationMinutes = 60;
  /// _getWorkHours(workHours, consultationMinutes) =>
  /// {'Monday':
  ///   [
  ///     1970-01-01 08:00:00.000,
  ///     1970-01-01 10:00:00.000,
  ///     1970-01-01 11:00:00.000,
  ///   ],
  /// }
  /// ```
  Map<String, List<DateTime>> _getWorkHours(
    Map<String, dynamic> workHours,
    int consultationMinutes,
  ) {
    final result = <String, List<DateTime>>{};

    // Iterate through the input work hours data
    workHours.forEach((day, timeData) {
      if (timeData != null && timeData is Map) {
        final startTime = timeData['start'] as String?;
        final endTime = timeData['end'] as String?;

        if (startTime != null && endTime != null) {
          // Parse the "start" and "end" times into DateTime objects
          final startDateTime =
              DateFormat('h:mm a').parse(startTime, true).toLocal();
          final endDateTime =
              DateFormat('h:mm a').parse(endTime, true).toLocal();

          // Generate the List<DateTime> representing the work hours for the day
          final workHoursList = <DateTime>[];
          var currentHour = startDateTime;
          while (currentHour.isBefore(endDateTime)) {
            workHoursList.add(currentHour);
            currentHour = currentHour.add(
              Duration(minutes: consultationMinutes),
            );
          }

          // Add the work hours for the day to the result map
          result[day] = workHoursList;
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
