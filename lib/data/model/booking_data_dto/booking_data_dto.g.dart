// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookingDataDto _$$_BookingDataDtoFromJson(Map json) => _$_BookingDataDto(
      id: json['id'] as String,
      specialistId: json['specialistId'] as String,
      userId: json['userId'] as String,
      notes: json['notes'] as String,
      durationMinutes: json['durationMinutes'] as int,
      bookTime: const DateTimeConverter().fromJson(json['bookTime']),
      endTime: const DateTimeConverter().fromJson(json['endTime']),
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$_BookingDataDtoToJson(_$_BookingDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'specialistId': instance.specialistId,
      'userId': instance.userId,
      'notes': instance.notes,
      'durationMinutes': instance.durationMinutes,
      'bookTime': const DateTimeConverter().toJson(instance.bookTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
    };
