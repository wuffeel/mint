import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_data_dto.freezed.dart';

part 'booking_data_dto.g.dart';

@freezed
class BookingDataDto with _$BookingDataDto {
  const factory BookingDataDto({
    required String specialistId,
    required String userId,
    required String notes,
    @JsonKey(toJson: _toDateTime)
    required DateTime bookTime,
    @JsonKey(toJson: _toDateTime)
    required DateTime createdAt,
  }) = _BookingDataDto;

  factory BookingDataDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDataDtoFromJson(json);
}

/// Used here because freezed generates toJson DateTime with toIsoString
/// conversion
DateTime _toDateTime(DateTime date) => date;
