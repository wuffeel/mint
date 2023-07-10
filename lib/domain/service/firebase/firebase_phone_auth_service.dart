import 'package:injectable/injectable.dart';
import 'package:mint/data/model/phone_code_sent_data.dart';
import 'package:mint/data/repository/abstract/phone_auth_repository.dart';
import 'package:mint/domain/service/abstract/phone_auth_service.dart';

@Injectable(as: PhoneAuthService)
class FirebasePhoneAuthService implements PhoneAuthService {
  FirebasePhoneAuthService(this._phoneAuthRepository);

  final PhoneAuthRepository _phoneAuthRepository;

  @override
  Future<PhoneCodeSentData> verifyPhoneNumber({
    required String phoneNumber,
    int? resendToken,
  }) async {
    return _phoneAuthRepository.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      resendToken: resendToken,
    );
  }

  @override
  Future<void> verifyOtpCode({
    required String otpCode,
    required String verificationId,
  }) async {
    return _phoneAuthRepository.verifyOtpCode(
      otpCode: otpCode,
      verificationId: verificationId,
    );
  }
}
