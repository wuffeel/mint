import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'user_model_dto.freezed.dart';

part 'user_model_dto.g.dart';

@freezed
class UserModelDto with _$UserModelDto {
  const factory UserModelDto({
    required String id,
    String? phoneNumber,
    String? pinCode,
    String? photoUrl,
    String? nameTag,
    String? firstName,
    String? lastName,
    @JsonKey(fromJson: DateUtils.tryConvertToDateTime) DateTime? dateOfBirth,
  }) = _UserModelDto;

  factory UserModelDto.fromJson(Map<String, dynamic> json) =>
      _$UserModelDtoFromJson(json);

  factory UserModelDto.fromJsonWithId(Map<String, dynamic> json, String id) =>
      _$UserModelDtoFromJson(<String, dynamic>{'id': id, ...json});
}
