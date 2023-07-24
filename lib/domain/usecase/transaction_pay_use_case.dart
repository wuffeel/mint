import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/transaction_data/transaction_data.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class TransactionPayUseCase {
  TransactionPayUseCase(this._service);

  final BookingService _service;

  Future<void> call(TransactionData transactionData) =>
      _service.payForSession(transactionData);
}
