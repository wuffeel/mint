part of 'pin_code_bloc.dart';

@immutable
abstract class PinCodeEvent {}

class PinCodeExistCheckRequested extends PinCodeEvent {}

class PinCodeEntered extends PinCodeEvent {
  PinCodeEntered(this.pinCode);

  final String pinCode;
}

class PinCodeConfirmRequested extends PinCodeEvent {
  PinCodeConfirmRequested(this.pinCode);

  final String pinCode;
}

class PinCodeChangeRequested extends PinCodeEvent {}

class PinCodeResetRequested extends PinCodeEvent {}

class PinCodeSignUpOtherRequested extends PinCodeEvent {}

class PinCodeChangeOtherRequested extends PinCodeEvent {}
