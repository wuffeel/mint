import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/payment_repository.dart';
import 'package:mint/domain/service/abstract/payment_service.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/credit_card_model_dto/credit_card_model_dto.dart';
import '../../entity/credit_card_model/credit_card_model.dart';

@Injectable(as: PaymentService)
class FirebasePaymentService implements PaymentService {
  FirebasePaymentService(
    this._paymentRepository,
    this._creditCardModelFromDto,
  );

  final PaymentRepository _paymentRepository;

  final Factory<CreditCardModel, CreditCardModelDto> _creditCardModelFromDto;

  @override
  Future<CreditCardModel> savePaymentMethod(
    String userId, {
    required bool isSaveForFuture,
  }) async {
    final paymentCard = await _paymentRepository.savePaymentMethod(
      userId,
      isSaveForFuture: isSaveForFuture,
    );
    return _creditCardModelFromDto.create(paymentCard);
  }

  @override
  Future<List<CreditCardModel>> getPaymentCards(String userId) async {
    final paymentCards = await _paymentRepository.getPaymentCards(userId);

    if (paymentCards.isEmpty) return <CreditCardModel>[];

    return paymentCards.map(_creditCardModelFromDto.create).toList();
  }
}