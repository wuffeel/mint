import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint_core/mint_utils.dart';

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
    @DateTimeConverter() required DateTime bookTime,
    @DateTimeConverter() required DateTime endTime,
    @DateTimeConverter() required DateTime createdAt,
  }) = _BookingDataDto;

  const BookingDataDto._();

  factory BookingDataDto.fromJson(Map<String, dynamic> json) =>
      _$BookingDataDtoFromJson(json);

  factory BookingDataDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$BookingDataDtoFromJson(<String, dynamic>{'id': id, ...json});

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}
