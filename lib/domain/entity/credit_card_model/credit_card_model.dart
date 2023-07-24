import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credit_card_model.freezed.dart';

@freezed
class CreditCardModel with _$CreditCardModel {
  const factory CreditCardModel({
    required String number,
    required int expirationMonth,
    required int expirationYear,
    required int cvv,
}) = _CreditCardModel;
}
