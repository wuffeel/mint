import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'specialist_work_info_dto.freezed.dart';

part 'specialist_work_info_dto.g.dart';

@freezed
class SpecialistWorkInfoDto with _$SpecialistWorkInfoDto {
  const factory SpecialistWorkInfoDto({
    required int bookingDaysAdvance,
    required int consultationMinutes,
    required String specialistId,
    required dynamic workHours,
    @Default(<DateTime>[])
    @JsonKey(fromJson: DateUtils.convertToDateTimeList)
    /// Vacations and exclusions
    List<DateTime> excludedDays,
    @Default(<DateTime>[])
    @JsonKey(fromJson: DateUtils.convertToDateTimeList)
    List<DateTime> bookedTimes,
  }) = _SpecialistWorkInfoDto;

  factory SpecialistWorkInfoDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialistWorkInfoDtoFromJson(json);
}
