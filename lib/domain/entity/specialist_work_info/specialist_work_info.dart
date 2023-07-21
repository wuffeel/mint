import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialist_work_info.freezed.dart';

@freezed
class SpecialistWorkInfo with _$SpecialistWorkInfo {
  const factory SpecialistWorkInfo({
    required int bookingDaysAdvance,
    required int consultationMinutes,
    required List<DateTime> excludedDays,
    required String specialistId,
    required Map<String, List<DateTime>> workHours,
    required List<DateTime> bookedTimes,
  }) = _SpecialistWorkInfo;
}
