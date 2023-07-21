// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingDataDto _$$_BookingDataDtoFromJson(Map<String, dynamic> json) =>
    _$_BookingDataDto(
      specialistId: json['specialistId'] as String,
      userId: json['userId'] as String,
      notes: json['notes'] as String,
      bookTime: DateTime.parse(json['bookTime'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_BookingDataDtoToJson(_$_BookingDataDto instance) =>
    <String, dynamic>{
      'specialistId': instance.specialistId,
      'userId': instance.userId,
      'notes': instance.notes,
      'bookTime': _toDateTime(instance.bookTime),
      'createdAt': _toDateTime(instance.createdAt),
    };
