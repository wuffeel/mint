import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/transaction_data/transaction_data.dart';
import 'package:mint/domain/service/abstract/payment_service.dart';

@injectable
class TransactionPayUseCase {
  TransactionPayUseCase(this._service);

  final PaymentService _service;

  Future<void> call(TransactionData transactionData) =>
      _service.payForSession(transactionData);
}
