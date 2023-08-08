// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_data_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDataDto _$$_TransactionDataDtoFromJson(Map json) =>
    _$_TransactionDataDto(
      id: json['id'] as String,
      bookingId: json['bookingId'] as String,
      specialistId: json['specialistId'] as String,
      userId: json['userId'] as String,
      paymentMethodId: json['paymentMethodId'] as String,
      amount: json['amount'] as int,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$_TransactionDataDtoToJson(
        _$_TransactionDataDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'bookingId': instance.bookingId,
      'specialistId': instance.specialistId,
      'userId': instance.userId,
      'paymentMethodId': instance.paymentMethodId,
      'amount': instance.amount,
      'createdAt': _toDateTime(instance.createdAt),
    };
