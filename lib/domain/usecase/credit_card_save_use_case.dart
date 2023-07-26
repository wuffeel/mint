import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart';
import 'package:mint/domain/service/abstract/payment_service.dart';

@injectable
class CreditCardSaveUseCase {
  CreditCardSaveUseCase(this._service);

  final PaymentService _service;

  Future<CreditCardModel> call(
    String userId, {
    required bool isSaveForFuture,
  }) {
    return _service.savePaymentMethod(userId, isSaveForFuture: isSaveForFuture);
  }
}
