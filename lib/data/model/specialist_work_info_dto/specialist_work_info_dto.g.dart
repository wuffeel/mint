// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_work_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecialistWorkInfoDto _$$_SpecialistWorkInfoDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SpecialistWorkInfoDto(
      bookingDaysAdvance: json['bookingDaysAdvance'] as int,
      consultationMinutes: json['consultationMinutes'] as int,
      specialistId: json['specialistId'] as String,
      workHours: json['workHours'] as List<dynamic>,
      excludedDays: json['excludedDays'] == null
          ? const <DateTime>[]
          : DateUtils.convertToDateTimeList(json['excludedDays'] as List),
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
    };
