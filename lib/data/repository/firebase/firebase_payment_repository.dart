import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart';
import 'package:mint/data/repository/abstract/payment_repository.dart';

import '../../model/transaction_data_dto/transaction_data_dto.dart';

@Injectable(as: PaymentRepository)
class FirebasePaymentRepository implements PaymentRepository {
  final _functionsInstance = FirebaseFunctions.instance;
  final _firestoreInstance = FirebaseFirestore.instance;
  final _stripeInstance = Stripe.instance;

  static const _saveCardFunction = 'savePaymentMethod';
  static const _fetchCardsFunction = 'fetchUserPaymentCards';
  static const _transactionsCollection = 'transactions';

  CollectionReference get _transactionCollectionRef =>
      _firestoreInstance.collection(_transactionsCollection);

  @override
  Future<CreditCardModelDto> savePaymentMethod(
    String userId, {
    required bool isSaveForFuture,
  }) async {
    final paymentMethod = await _stripeInstance.createPaymentMethod(
      params: const PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );

    final callable = _functionsInstance.httpsCallable(_saveCardFunction);

    final result = await callable.call<Map<String, dynamic>>({
      'userId': userId,
      'paymentMethodId': paymentMethod.id,
      'isSaveForFuture': isSaveForFuture,
    });

    final data = result.data;

    return CreditCardModelDto.fromJson(data);
  }

  @override
  Future<List<CreditCardModelDto>> getPaymentCards(String userId) async {
    final callable = _functionsInstance.httpsCallable(_fetchCardsFunction);

    final result = await callable.call<List<dynamic>>({'userId': userId});

    final data =
        result.data.map((e) => Map<String, dynamic>.from(e as Map)).toList();

    if (data.isEmpty) return <CreditCardModelDto>[];

    return data.map(CreditCardModelDto.fromJson).toList();
  }

  @override
  Future<void> payForSession(TransactionDataDto transactionData) {
    return _transactionCollectionRef.add(transactionData.toJsonWithoutId());
  }
}
