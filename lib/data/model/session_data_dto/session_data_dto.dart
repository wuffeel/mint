import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'session_data_dto.freezed.dart';

part 'session_data_dto.g.dart';

@freezed
class SessionDataDto with _$SessionDataDto {
  const factory SessionDataDto({
    required String id,
    required String specialistId,
    required String userId,
    required String notes,
    required int durationMinutes,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime bookTime,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime createdAt,
  }) = _SessionDataDto;

  factory SessionDataDto.fromJson(Map<String, dynamic> json) =>
      _$SessionDataDtoFromJson(json);
}
