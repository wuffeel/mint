import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model_dto.freezed.dart';

part 'credit_card_model_dto.g.dart';

@freezed
class CreditCardModelDto with _$CreditCardModelDto {
  const factory CreditCardModelDto({
    required String id,
    required String last4,
    required String cardBrand,
    required int expirationMonth,
    required int expirationYear,
    required String fingerprint,
  }) = _CreditCardModelDto;

  factory CreditCardModelDto.fromJson(Map<String, dynamic> json) =>
      _$CreditCardModelDtoFromJson(json);
}
