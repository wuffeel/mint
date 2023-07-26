import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';

import '../../data/model/transaction_data_dto/transaction_data_dto.dart';
import '../../domain/entity/transaction_data/transaction_data.dart';

@Injectable(as: Factory<TransactionDataDto, TransactionData>)
class TransactionDataToDto
    implements Factory<TransactionDataDto, TransactionData> {
  @override
  TransactionDataDto create(TransactionData param) => TransactionDataDto(
        id: '',
        bookingId: param.bookingId,
        specialistId: param.specialistId,
        userId: param.userId,
        paymentMethodId: param.paymentMethodId,
        amount: param.amount,
        createdAt: DateTime.now().toUtc(),
      );
}
