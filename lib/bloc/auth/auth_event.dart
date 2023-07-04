part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthPhoneVerificationRequested extends AuthEvent {
  AuthPhoneVerificationRequested(this.phoneNumber);

  final String phoneNumber;
}

class AuthOtpVerificationRequested extends AuthEvent {
  AuthOtpVerificationRequested(this.otpCode);

  final String otpCode;
}

class AuthOtpResendRequested extends AuthEvent {}

class AuthForgotPinRequested extends AuthEvent {}
