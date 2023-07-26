import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_data_dto.freezed.dart';

part 'transaction_data_dto.g.dart';

@freezed
class TransactionDataDto with _$TransactionDataDto {
  const factory TransactionDataDto({
    required String id,
    required String bookingId,
    required String specialistId,
    required String userId,
    required String paymentMethodId,
    required int amount,
    @JsonKey(toJson: _toDateTime)
    required DateTime createdAt,
  }) = _TransactionDataDto;

  const TransactionDataDto._();

  factory TransactionDataDto.fromJson(Map<String, dynamic> json) =>
      _$TransactionDataDtoFromJson(json);

  Map<String, dynamic> toJsonWithoutId() => toJson()..remove('id');
}

/// Used here because freezed generates toJson DateTime with toIsoString
/// conversion
DateTime _toDateTime(DateTime date) => date;
