import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/credit_card_model/credit_card_model.dart';
import 'package:mint/domain/service/abstract/payment_service.dart';

@injectable
class CreditCardListFetchUseCase {
  CreditCardListFetchUseCase(this._service);

  final PaymentService _service;

  Future<List<CreditCardModel>> call(String userId) =>
      _service.getPaymentCards(userId);
}
