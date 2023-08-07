// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_card_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CreditCardModelDto _$$_CreditCardModelDtoFromJson(Map json) =>
    _$_CreditCardModelDto(
      id: json['id'] as String,
      last4: json['last4'] as String,
      cardBrand: json['cardBrand'] as String,
      expirationMonth: json['expirationMonth'] as int,
      expirationYear: json['expirationYear'] as int,
      fingerprint: json['fingerprint'] as String,
    );

Map<String, dynamic> _$$_CreditCardModelDtoToJson(
        _$_CreditCardModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'last4': instance.last4,
      'cardBrand': instance.cardBrand,
      'expirationMonth': instance.expirationMonth,
      'expirationYear': instance.expirationYear,
      'fingerprint': instance.fingerprint,
    };
