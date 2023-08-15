// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fcm_token_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FcmTokenDto _$$_FcmTokenDtoFromJson(Map json) => _$_FcmTokenDto(
      token: json['token'] as String,
      createdAt: DateUtils.convertToDateTime(json['createdAt']),
    );

Map<String, dynamic> _$$_FcmTokenDtoToJson(_$_FcmTokenDto instance) =>
    <String, dynamic>{
      'token': instance.token,
      'createdAt': instance.createdAt.toIso8601String(),
    };
