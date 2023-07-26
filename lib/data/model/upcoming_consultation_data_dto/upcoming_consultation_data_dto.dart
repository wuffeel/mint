import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'upcoming_consultation_data_dto.freezed.dart';

part 'upcoming_consultation_data_dto.g.dart';

@freezed
class UpcomingConsultationDataDto with _$UpcomingConsultationDataDto {
  const factory UpcomingConsultationDataDto({
    required String id,
    required String specialistId,
    required String userId,
    required String notes,
    required int durationMinutes,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime bookTime,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime createdAt,
  }) = _UpcomingConsultationDataDto;

  factory UpcomingConsultationDataDto.fromJson(Map<String, dynamic> json) =>
      _$UpcomingConsultationDataDtoFromJson(json);
}
