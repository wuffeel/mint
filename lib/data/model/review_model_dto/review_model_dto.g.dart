// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReviewModelDto _$$_ReviewModelDtoFromJson(Map json) => _$_ReviewModelDto(
      id: json['id'] as String,
      userId: json['userId'] as String,
      specialistId: json['specialistId'] as String,
      rating: (json['rating'] as num).toDouble(),
      createdAt: const DateTimeConverter().fromJson(json['createdAt']),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$_ReviewModelDtoToJson(_$_ReviewModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'specialistId': instance.specialistId,
      'rating': instance.rating,
      'createdAt': const DateTimeConverter().toJson(instance.createdAt),
      'content': instance.content,
    };
