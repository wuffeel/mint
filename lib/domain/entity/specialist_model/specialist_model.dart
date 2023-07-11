import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialist_model.freezed.dart';

@freezed
class SpecialistModel with _$SpecialistModel {
  const factory SpecialistModel({
    required String id,
    required String firstName,
    required String lastName,
    required int price,
    required int experience,
    required double rating,
    String? photoUrl,
  }) = _SpecialistModel;
}
