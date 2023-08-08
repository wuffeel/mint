import '../../entity/credit_card_model/credit_card_model.dart';
import '../../entity/transaction_data/transaction_data.dart';

abstract class PaymentService {
  Future<List<CreditCardModel>> getPaymentCards(String userId);

  Future<CreditCardModel> savePaymentMethod(
    String userId, {
    required bool isSaveForFuture,
  });

  Future<void> payForSession(TransactionData transactionData);
}
