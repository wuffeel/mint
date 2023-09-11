import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../data/model/credit_card_model_dto/credit_card_model_dto.dart';
import '../../domain/entity/credit_card_model/credit_card_model.dart';

@Injectable(as: Factory<CreditCardModel, CreditCardModelDto>)
class CreditCardModelFromDto
    implements Factory<CreditCardModel, CreditCardModelDto> {
  @override
  CreditCardModel create(CreditCardModelDto param) {
    return CreditCardModel(
      id: param.id,
      last4: param.last4,
      cardBrand: param.cardBrand,
      expirationMonth: param.expirationMonth,
      expirationYear: param.expirationYear,
      fingerprint: param.fingerprint,
    );
  }
}
