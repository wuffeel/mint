import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.freezed.dart';

@freezed
class CreditCardModel with _$CreditCardModel {
  const factory CreditCardModel({
    required String id,
    required String last4,
    required String cardBrand,
    required int expirationMonth,
    required int expirationYear,
    required String fingerprint,
}) = _CreditCardModel;
}
