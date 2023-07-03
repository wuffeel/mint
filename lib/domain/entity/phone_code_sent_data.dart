class PhoneCodeSentData {
  PhoneCodeSentData({
    required this.verificationId,
    this.resendToken,
    this.otpCode,
  });

  final String verificationId;
  final int? resendToken;
  final String? otpCode;
}
