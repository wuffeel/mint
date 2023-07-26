import 'package:mint/data/model/credit_card_model_dto/credit_card_model_dto.dart';

abstract class PaymentRepository {
  Future<List<CreditCardModelDto>> getPaymentCards(String userId);

  Future<CreditCardModelDto> savePaymentMethod(
    String userId, {
    required bool isSaveForFuture,
  });
}
