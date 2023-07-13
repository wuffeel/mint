import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/experience_model.dart';

part 'filter_preferences.freezed.dart';

@freezed
class FilterPreferences with _$FilterPreferences {
  const factory FilterPreferences({
    int? lowPrice,
    int? highPrice,
    ExperienceModel? experience,
    List<String>? specializations,
  }) = _FilterPreferences;

  const FilterPreferences._();

  static const empty = FilterPreferences();

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;
}
