import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/phone_auth_service.dart';

@injectable
class VerifyOtpUseCase {
  VerifyOtpUseCase(this._service);

  final PhoneAuthService _service;

  Future<void> call({
    required String otpCode,
    String? verificationId,
  }) =>
      _service.verifyOtpCode(
        otpCode: otpCode,
        verificationId: verificationId,
      );
}
