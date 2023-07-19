// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecialistFilterDto _$$_SpecialistFilterDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SpecialistFilterDto(
      minPrice: json['minPrice'] as int,
      maxPrice: json['maxPrice'] as int,
      experience: (json['experience'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      specializations: (json['specializations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_SpecialistFilterDtoToJson(
        _$_SpecialistFilterDto instance) =>
    <String, dynamic>{
      'minPrice': instance.minPrice,
      'maxPrice': instance.maxPrice,
      'experience': instance.experience,
      'specializations': instance.specializations,
    };
