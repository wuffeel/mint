import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialist_filter_dto.freezed.dart';

part 'specialist_filter_dto.g.dart';

@freezed
class SpecialistFilterDto with _$SpecialistFilterDto {
  const factory SpecialistFilterDto({
    required int minPrice,
    required int maxPrice,
    required List<String> experience,
    required List<String> specializations,
  }) = _SpecialistFilterDto;

  const SpecialistFilterDto._();

  factory SpecialistFilterDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialistFilterDtoFromJson(json);

  static const empty = SpecialistFilterDto(
    minPrice: 0,
    maxPrice: 0,
    experience: [],
    specializations: [],
  );

  bool get isEmpty => this == empty;
}
