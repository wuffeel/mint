import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_preferences_dto.freezed.dart';

@freezed
class FilterPreferencesDto with _$FilterPreferencesDto {
  const factory FilterPreferencesDto({
    int? lowPrice,
    int? highPrice,
    DateTime? experienceFrom,
    DateTime? experienceTo,
    List<String>? specializations,
  }) = _FilterPreferencesDto;

  const FilterPreferencesDto._();

  static const empty = FilterPreferencesDto();

  bool get isEmpty => this == empty;

  bool get isNotEmpty => this != empty;
}
