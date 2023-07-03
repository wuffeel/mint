class PhoneCodeSentData {
  PhoneCodeSentData({
    required this.verificationId,
    this.resendToken,
  });

  final String verificationId;
  final int? resendToken;
}
