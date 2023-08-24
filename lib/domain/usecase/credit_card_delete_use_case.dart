import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/payment_service.dart';

@injectable
class CreditCardDeleteUseCase {
  CreditCardDeleteUseCase(this._service);

  final PaymentService _service;

  Future<void> call(String paymentMethodId) {
    return _service.deletePaymentMethod(paymentMethodId);
  }
}
