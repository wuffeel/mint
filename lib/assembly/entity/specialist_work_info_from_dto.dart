import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:mint/assembly/factory.dart';

import '../../data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import '../../domain/entity/specialist_work_info/specialist_work_info.dart';

@Injectable(as: Factory<SpecialistWorkInfo, SpecialistWorkInfoDto>)
class SpecialistWorkInfoFromDto
    implements Factory<SpecialistWorkInfo, SpecialistWorkInfoDto> {
  Map<String, List<DateTime>> getWorkHours(
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
          final startDateTime = DateFormat('h:mm a').parse(startTime);
          final endDateTime = DateFormat('h:mm a').parse(endTime);

          // Generate the List<DateTime> representing the work hours for the day
          final workHoursList = <DateTime>[];
          var currentHour = startDateTime;
          while (currentHour.isBefore(endDateTime)) {
            workHoursList.add(currentHour);
            currentHour = currentHour.add(
              Duration(
                minutes: consultationMinutes,
              ),
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
      workHours: [
        ...param.workHours.map(
          (e) => getWorkHours(
            Map<String, dynamic>.from(e as Map),
            param.consultationMinutes,
          ),
        )
      ],
    );
  }
}
