import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart';
import 'package:mint/data/repository/abstract/payment_repository.dart';
import 'package:mint_core/mint_module.dart';

import '../../model/transaction_data_dto/transaction_data_dto.dart';

@Injectable(as: PaymentRepository)
class FirebasePaymentRepository implements PaymentRepository {
  FirebasePaymentRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  final _stripeInstance = Stripe.instance;

  static const _saveCardFunction = 'savePaymentMethod';
  static const _deleteCardFunction = 'deletePaymentMethod';
  static const _fetchCardsFunction = 'fetchUserPaymentCards';
  static const _transactionsCollection = 'transactions';

  Future<CollectionReference<Map<String, dynamic>>>
      get _transactionCollectionRef async {
    return (await _firebaseInitializer.firestore)
        .collection(_transactionsCollection);
  }

  @override
  Future<List<CreditCardModelDto>> getPaymentCards(String userId) async {
    final functions = await _firebaseInitializer.functions;
    final callable = functions.httpsCallable(_fetchCardsFunction);

    final result = await callable.call<List<dynamic>>({'userId': userId});

    final data =
        result.data.map((e) => Map<String, dynamic>.from(e as Map)).toList();

    if (data.isEmpty) return <CreditCardModelDto>[];

    return data.map(CreditCardModelDto.fromJson).toList();
  }

  @override
  Future<CreditCardModelDto> savePaymentMethod(
    String userId, {
    required bool isSaveForFuture,
  }) async {
    final functions = await _firebaseInitializer.functions;

    final paymentMethod = await _stripeInstance.createPaymentMethod(
      params: const PaymentMethodParams.card(
        paymentMethodData: PaymentMethodData(),
      ),
    );

    final callable = functions.httpsCallable(_saveCardFunction);

    final result = await callable.call<Map<String, dynamic>>({
      'userId': userId,
      'paymentMethodId': paymentMethod.id,
      'isSaveForFuture': isSaveForFuture,
    });

    final data = result.data;

    return CreditCardModelDto.fromJson(data);
  }

  @override
  Future<void> deletePaymentMethod(String paymentMethodId) async {
    final functions = await _firebaseInitializer.functions;

    final callable = functions.httpsCallable(_deleteCardFunction);
    await callable.call<void>({'paymentMethodId': paymentMethodId});
  }

  @override
  Future<void> payForSession(TransactionDataDto transactionData) async {
    final transactionCollection = await _transactionCollectionRef;
    await transactionCollection.add(transactionData.toJsonWithoutId());
  }
}
