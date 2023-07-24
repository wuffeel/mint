import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_data.freezed.dart';

@freezed
class TransactionData with _$TransactionData {
  const factory TransactionData({
    required String bookingId,
    required String specialistId,
    required String userId,
    required int price,
  }) = _TransactionData;
}
