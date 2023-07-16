// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModelDto _$$_ReviewModelDtoFromJson(Map<String, dynamic> json) =>
    _$_ReviewModelDto(
      userId: json['userId'] as String,
      specialistId: json['specialistId'] as String,
      rating: (json['rating'] as num).toDouble(),
      createdAt: DateUtils.convertToDateTime(json['createdAt']),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_ReviewModelDtoToJson(_$_ReviewModelDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'specialistId': instance.specialistId,
      'rating': instance.rating,
      'createdAt': instance.createdAt.toIso8601String(),
      'content': instance.content,
    };
