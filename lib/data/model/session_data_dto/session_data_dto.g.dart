// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SessionDataDto _$$_SessionDataDtoFromJson(Map<String, dynamic> json) =>
    _$_SessionDataDto(
      id: json['id'] as String,
      specialistId: json['specialistId'] as String,
      userId: json['userId'] as String,
      notes: json['notes'] as String,
      durationMinutes: json['durationMinutes'] as int,
      bookTime: DateUtils.convertToDateTime(json['bookTime']),
      createdAt: DateUtils.convertToDateTime(json['createdAt']),
    );

Map<String, dynamic> _$$_SessionDataDtoToJson(_$_SessionDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specialistId': instance.specialistId,
      'userId': instance.userId,
      'notes': instance.notes,
      'durationMinutes': instance.durationMinutes,
      'bookTime': instance.bookTime.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
    };
