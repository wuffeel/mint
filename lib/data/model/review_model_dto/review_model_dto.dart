import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'review_model_dto.freezed.dart';

part 'review_model_dto.g.dart';

@freezed
class ReviewModelDto with _$ReviewModelDto {
  const factory ReviewModelDto({
    required String id,
    required String userId,
    required String specialistId,
    required double rating,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime createdAt,
    String? content,
  }) = _ReviewModelDto;

  const ReviewModelDto._();

  factory ReviewModelDto.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelDtoFromJson(json);

  factory ReviewModelDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$ReviewModelDtoFromJson(<String, dynamic>{'id': id, ...json});

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}
