part of 'pin_code_bloc.dart';

@immutable
abstract class PinCodeState {}

class PinCodeInitial extends PinCodeState {
  PinCodeInitial(this.status);

  final PinCodeStatusInitial status;
}

class PinCodeEnterSuccess extends PinCodeState {
  PinCodeEnterSuccess(this.status, this.pinCode);

  final PinCodeStatusEntered status;
  final String pinCode;
}

class PinCodeMismatch extends PinCodeEnterSuccess {
  PinCodeMismatch(super.status, super.pinCode);
}

class PinCodeFailure extends PinCodeEnterSuccess {
  PinCodeFailure(super.status, super.pinCode);
}

class PinCodeSignInConfirmSuccess extends PinCodeEnterSuccess {
  PinCodeSignInConfirmSuccess(super.status, super.pinCode);
}

class PinCodeSignUpConfirmSuccess extends PinCodeEnterSuccess {
  PinCodeSignUpConfirmSuccess(super.status, super.pinCode);
}

class PinCodeNewConfirmSuccess extends PinCodeEnterSuccess {
  PinCodeNewConfirmSuccess(super.status, super.pinCode);
}

class PinCodeResetSuccess extends PinCodeState {}

class PinCodeResetFailure extends PinCodeState {}
