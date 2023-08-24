import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'booking_data_dto.freezed.dart';

part 'booking_data_dto.g.dart';

@freezed
class BookingDataDto with _$BookingDataDto {
  const factory BookingDataDto({
    required String id,
    required String specialistId,
    required String userId,
    required String notes,
    required int durationMinutes,
    @JsonKey(fromJson: DateUtils.convertToDateTime, toJson: _toDateTime)
    required DateTime bookTime,
    @JsonKey(fromJson: DateUtils.convertToDateTime, toJson: _toDateTime)
    required DateTime endTime,
    @JsonKey(fromJson: DateUtils.convertToDateTime, toJson: _toDateTime)
    required DateTime createdAt,
  }) = _BookingDataDto;

  const BookingDataDto._();

  factory BookingDataDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDataDtoFromJson(json);

  factory BookingDataDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$BookingDataDtoFromJson(<String, dynamic>{'id': id, ...json});

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}

/// Used here because freezed generates toJson DateTime with toIsoString
/// conversion
DateTime _toDateTime(DateTime date) => date;
