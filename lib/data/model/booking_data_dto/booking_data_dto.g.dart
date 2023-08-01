// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingDataDto _$$_BookingDataDtoFromJson(Map<String, dynamic> json) =>
    _$_BookingDataDto(
      id: json['id'] as String,
      specialistId: json['specialistId'] as String,
      userId: json['userId'] as String,
      notes: json['notes'] as String,
      durationMinutes: json['durationMinutes'] as int,
      bookTime: DateUtils.convertToDateTime(json['bookTime']),
      endTime: DateUtils.convertToDateTime(json['endTime']),
      createdAt: DateUtils.convertToDateTime(json['createdAt']),
    );

Map<String, dynamic> _$$_BookingDataDtoToJson(_$_BookingDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specialistId': instance.specialistId,
      'userId': instance.userId,
      'notes': instance.notes,
      'durationMinutes': instance.durationMinutes,
      'bookTime': _toDateTime(instance.bookTime),
      'endTime': _toDateTime(instance.endTime),
      'createdAt': _toDateTime(instance.createdAt),
    };
