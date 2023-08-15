import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/utils/date_utils.dart';

part 'fcm_token_dto.freezed.dart';

part 'fcm_token_dto.g.dart';

@freezed
class FcmTokenDto with _$FcmTokenDto {
  const factory FcmTokenDto({
    required String token,
    @JsonKey(fromJson: DateUtils.convertToDateTime)
    required DateTime createdAt,
  }) = _FcmTokenDto;

  factory FcmTokenDto.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenDtoFromJson(json);
}
