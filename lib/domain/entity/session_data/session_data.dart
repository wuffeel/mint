import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

part 'session_data.freezed.dart';

@freezed
class SessionData with _$SessionData {
  const factory SessionData({
    required String id,
    required SpecialistModel specialistModel,
    required String notes,
    required DateTime bookTime,
    required int durationMinutes,
  }) = _SessionData;
}
