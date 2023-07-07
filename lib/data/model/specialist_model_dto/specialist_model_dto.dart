import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'specialist_model_dto.freezed.dart';

part 'specialist_model_dto.g.dart';

@freezed
class SpecialistModelDto with _$SpecialistModelDto {
  const factory SpecialistModelDto({
    required String id,
    required String firstName,
    required String lastName,
    required int price,
    required int experience,
    required double rating,
    String? photoUrl,
  }) = _SpecialistModelDto;

  factory SpecialistModelDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialistModelDtoFromJson(json);
}
