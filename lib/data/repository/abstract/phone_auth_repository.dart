import 'package:mint/data/model/phone_code_sent_data.dart';

abstract class PhoneAuthRepository {
  Future<PhoneCodeSentData> verifyPhoneNumber({
    required String phoneNumber,
    int? resendToken,
  });

  Future<void> verifyOtpCode({
    required String otpCode,
    required String verificationId,
  });
}
