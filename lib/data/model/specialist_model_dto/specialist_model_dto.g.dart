// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specialist_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SpecialistModelDto _$$_SpecialistModelDtoFromJson(
        Map<String, dynamic> json) =>
    _$_SpecialistModelDto(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      price: json['price'] as int,
      experience: json['experience'] as int,
      rating: (json['rating'] as num).toDouble(),
      photoUrl: json['photoUrl'] as String?,
    );

Map<String, dynamic> _$$_SpecialistModelDtoToJson(
        _$_SpecialistModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'price': instance.price,
      'experience': instance.experience,
      'rating': instance.rating,
      'photoUrl': instance.photoUrl,
    };
