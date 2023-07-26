import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

part 'upcoming_consultation_data.freezed.dart';

@freezed
class UpcomingConsultationData with _$UpcomingConsultationData {
  const factory UpcomingConsultationData({
    required String id,
    required SpecialistModel specialistModel,
    required String notes,
    required DateTime bookTime,
    required int durationMinutes,
  }) = _UpcomingConsultationData;
}
