import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

part 'booking_data.freezed.dart';

@freezed
class BookingData with _$BookingData {
  const factory BookingData({
    required String id,
    required SpecialistModel specialistModel,
    required String userId,
    required String notes,
    required DateTime bookTime,
    required int durationMinutes,
  }) = _BookingData;
}
