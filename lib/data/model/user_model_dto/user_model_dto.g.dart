// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModelDto _$$_UserModelDtoFromJson(Map<String, dynamic> json) =>
    _$_UserModelDto(
      id: json['id'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      pinCode: json['pinCode'] as String?,
      photo: json['photo'] as String?,
      nameTag: json['nameTag'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: DateUtils.convertToDateTime(json['dateOfBirth']),
    );

Map<String, dynamic> _$$_UserModelDtoToJson(_$_UserModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phoneNumber': instance.phoneNumber,
      'pinCode': instance.pinCode,
      'photo': instance.photo,
      'nameTag': instance.nameTag,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth?.toIso8601String(),
    };
