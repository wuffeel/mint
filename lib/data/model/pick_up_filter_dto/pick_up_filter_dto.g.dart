// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pick_up_filter_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PickUpFilterDto _$$_PickUpFilterDtoFromJson(Map json) => _$_PickUpFilterDto(
      communicationMembers: (json['communicationMembers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      priceRange: (json['priceRange'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      specializations: (json['specializations'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_PickUpFilterDtoToJson(_$_PickUpFilterDto instance) =>
    <String, dynamic>{
      'communicationMembers': instance.communicationMembers,
      'priceRange': instance.priceRange,
      'specializations': instance.specializations,
    };
