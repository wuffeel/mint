import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/phone_code_sent_data.dart';
import 'package:mint/domain/service/abstract/phone_auth_service.dart';

@injectable
class VerifyPhoneUseCase {
  VerifyPhoneUseCase(this._service);

  final PhoneAuthService _service;

  Future<PhoneCodeSentData> call({
    required String phoneNumber,
    int? resendToken,
  }) =>
      _service.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        resendToken: resendToken,
      );
}
