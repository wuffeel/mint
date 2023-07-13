import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pick_up_filter_dto.freezed.dart';

part 'pick_up_filter_dto.g.dart';


@freezed
class PickUpFilterDto with _$PickUpFilterDto {
  const factory PickUpFilterDto({
    required List<String> communicationMembers,
    required List<String> priceRange,
    required List<String> specializations,
  }) = _PickUpFilterDto;

  const PickUpFilterDto._();

  factory PickUpFilterDto.fromJson(Map<String, dynamic> json) =>
      _$PickUpFilterDtoFromJson(json);

  static const empty = PickUpFilterDto(
    communicationMembers: [],
    priceRange: [],
    specializations: [],
  );

  bool get isEmpty => this == empty;
}
