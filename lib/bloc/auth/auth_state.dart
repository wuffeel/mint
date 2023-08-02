part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthPhoneVerificationLoading extends AuthState {}

class AuthPhoneVerificationInvalidPhone extends AuthState {}

class AuthPhoneVerificationFailure extends AuthState {}

class AuthPhoneVerificationTooManyRequests extends AuthState {}

class AuthPhoneVerificationSuccess extends AuthState {
  AuthPhoneVerificationSuccess(this.phoneNumber, this.phoneCodeSentData);

  final String phoneNumber;
  final PhoneCodeSentData phoneCodeSentData;
}

class AuthOtpVerificationLoading extends AuthPhoneVerificationSuccess {
  AuthOtpVerificationLoading(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpVerificationMismatch extends AuthPhoneVerificationSuccess {
  AuthOtpVerificationMismatch(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpVerificationFailure extends AuthPhoneVerificationSuccess {
  AuthOtpVerificationFailure(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpResendLoading extends AuthPhoneVerificationSuccess {
  AuthOtpResendLoading(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpResendSuccess extends AuthPhoneVerificationSuccess {
  AuthOtpResendSuccess(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpResendFailure extends AuthPhoneVerificationSuccess {
  AuthOtpResendFailure(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpVerificationSuccess extends AuthPhoneVerificationSuccess {
  AuthOtpVerificationSuccess(super.phoneNumber, super.phoneCodeSentData);
}

class AuthForgotPinLoading extends AuthState {}
