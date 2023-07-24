import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_data.freezed.dart';

@freezed
class BookingData with _$BookingData {
  const factory BookingData({
    required String specialistId,
    required String userId,
    required String notes,
    required DateTime bookTime,
    required int durationMinutes,
    required DateTime createdAt,
  }) = _BookingData;
}
