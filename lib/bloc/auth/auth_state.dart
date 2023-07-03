part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthPhoneVerificationLoading extends AuthState {}

class AuthPhoneVerificationSuccess extends AuthState {
  AuthPhoneVerificationSuccess(this.phoneNumber, this.phoneCodeSentData);

  final String phoneNumber;
  final PhoneCodeSentData phoneCodeSentData;
}

class AuthPhoneVerificationFailure extends AuthState {
  AuthPhoneVerificationFailure(this.error);

  final String error;
}

class AuthOtpVerificationLoading extends AuthPhoneVerificationSuccess {
  AuthOtpVerificationLoading(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpVerificationFailure extends AuthPhoneVerificationSuccess {
  AuthOtpVerificationFailure(
    this.error,
    super.phoneNumber,
    super.phoneCodeSentData,
  );

  final String error;
}

class AuthOtpResendLoading extends AuthPhoneVerificationSuccess {
  AuthOtpResendLoading(super.phoneNumber, super.phoneCodeSentData);
}

class AuthOtpResendFailure extends AuthPhoneVerificationSuccess {
  AuthOtpResendFailure(
    this.error,
    super.phoneNumber,
    super.phoneCodeSentData,
  );

  final String error;
}

class AuthOtpVerificationSuccess extends AuthState {}
