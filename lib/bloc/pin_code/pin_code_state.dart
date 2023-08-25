part of 'pin_code_bloc.dart';

@immutable
abstract class PinCodeState {}

mixin PinCodeConfirmed on PinCodeState {}

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

class PinCodeSignInConfirmSuccess extends PinCodeEnterSuccess
    with PinCodeConfirmed {
  PinCodeSignInConfirmSuccess(super.status, super.pinCode);
}

class PinCodeSignUpConfirmSuccess extends PinCodeEnterSuccess
    with PinCodeConfirmed {
  PinCodeSignUpConfirmSuccess(super.status, super.pinCode);
}

class PinCodeNewConfirmSuccess extends PinCodeEnterSuccess
    with PinCodeConfirmed {
  PinCodeNewConfirmSuccess(super.status, super.pinCode);
}

class PinCodeResetSuccess extends PinCodeInitial {
  PinCodeResetSuccess() : super(PinCodeStatusInitial.signUp);
}

class PinCodeResetFailure extends PinCodeEnterSuccess {
  PinCodeResetFailure(super.status, super.pinCode);
}
