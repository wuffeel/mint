import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'specialist_model_dto.freezed.dart';

part 'specialist_model_dto.g.dart';

@freezed
class SpecialistModelDto with _$SpecialistModelDto {
  const factory SpecialistModelDto({
    required String id,
    required String firstName,
    required String lastName,
    required int price,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime experience,
    @Default(0.0) double rating,
    @Default(0) int reviewCount,
    @Default(<String>[]) List<String> specializations,
    String? photoUrl,
    String? about,
    String? education,
  }) = _SpecialistModelDto;

  factory SpecialistModelDto.fromJson(Map<String, dynamic> json) =>
      _$SpecialistModelDtoFromJson(json);
}