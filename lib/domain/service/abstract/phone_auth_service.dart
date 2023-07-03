import 'package:mint/domain/entity/phone_code_sent_data.dart';

abstract class PhoneAuthService {
  Future<PhoneCodeSentData> verifyPhoneNumber({
    required String phoneNumber,
    int? resendToken,
  });

  Future<void> verifyOtpCode({required String otpCode, String? verificationId});
}
