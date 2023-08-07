// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_work_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecialistWorkInfoDto _$$_SpecialistWorkInfoDtoFromJson(Map json) =>
    _$_SpecialistWorkInfoDto(
      bookingDaysAdvance: json['bookingDaysAdvance'] as int,
      consultationMinutes: json['consultationMinutes'] as int,
      specialistId: json['specialistId'] as String,
      workHours: Map<String, dynamic>.from(json['workHours'] as Map),
      excludedDays: json['excludedDays'] == null
          ? const <DateTime>[]
          : DateUtils.convertToDateTimeList(json['excludedDays'] as List),
      bookedTimes: json['bookedTimes'] == null
          ? const <DateTime>[]
          : DateUtils.convertToDateTimeList(json['bookedTimes'] as List),
    );

Map<String, dynamic> _$$_SpecialistWorkInfoDtoToJson(
        _$_SpecialistWorkInfoDto instance) =>
    <String, dynamic>{
      'bookingDaysAdvance': instance.bookingDaysAdvance,
      'consultationMinutes': instance.consultationMinutes,
      'specialistId': instance.specialistId,
      'workHours': instance.workHours,
      'excludedDays':
          instance.excludedDays.map((e) => e.toIso8601String()).toList(),
      'bookedTimes':
          instance.bookedTimes.map((e) => e.toIso8601String()).toList(),
    };
