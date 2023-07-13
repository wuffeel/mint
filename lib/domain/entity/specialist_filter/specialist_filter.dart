import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/experience_model.dart';

part 'specialist_filter.freezed.dart';

@freezed
class SpecialistFilter with _$SpecialistFilter {
  const factory SpecialistFilter({
    required int minPrice,
    required int maxPrice,
    required List<ExperienceModel> experience,
    required List<String> specializations,
  }) = _SpecialistFilter;

  const SpecialistFilter._();

  static const empty = SpecialistFilter(
    minPrice: 0,
    maxPrice: 0,
    experience: [],
    specializations: [],
  );

  bool get isEmpty => this == empty;
}
