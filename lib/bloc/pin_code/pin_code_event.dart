part of 'pin_code_bloc.dart';

@immutable
abstract class PinCodeEvent {}

class PinCodeExistCheckRequested extends PinCodeEvent {}

class PinCodeEntered extends PinCodeEvent {
  PinCodeEntered(this.pinCode);

  final String pinCode;
}

class PinCodeSignInRequested extends PinCodeEvent {}

class PinCodeSignInConfirmRequested extends PinCodeEvent {
  PinCodeSignInConfirmRequested(this.confirmPin);

  final String confirmPin;
}

class PinCodeResetRequested extends PinCodeEvent {}

class PinCodeSignUpRequested extends PinCodeEvent {}

class PinCodeSignUpEntered extends PinCodeEvent {
  PinCodeSignUpEntered(this.pinCode);

  final String pinCode;
}

class PinCodeSignUpConfirmRequested extends PinCodeEvent {
  PinCodeSignUpConfirmRequested(this.confirmPin);

  final String confirmPin;
}

class PinCodeChangeRequested extends PinCodeEvent {}

class PinCodeChangePreviousConfirmRequested extends PinCodeEvent {
  PinCodeChangePreviousConfirmRequested(this.confirmPin);

  final String confirmPin;
}

class PinCodeChangeEntered extends PinCodeEvent {
  PinCodeChangeEntered(this.pinCode);

  final String pinCode;
}

class PinCodeChangeOtherRequested extends PinCodeEvent {}

class PinCodeChangeConfirmRequested extends PinCodeEvent {
  PinCodeChangeConfirmRequested(this.confirmPin);

  final String confirmPin;
}
