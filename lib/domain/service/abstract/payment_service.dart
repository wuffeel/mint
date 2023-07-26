import '../../entity/credit_card_model/credit_card_model.dart';

abstract class PaymentService {
  Future<List<CreditCardModel>> getPaymentCards(String userId);

  Future<CreditCardModel> savePaymentMethod(
    String userId, {
    required bool isSaveForFuture,
  });
}
