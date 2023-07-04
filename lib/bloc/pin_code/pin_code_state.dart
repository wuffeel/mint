part of 'pin_code_bloc.dart';

@immutable
abstract class PinCodeState {}

class PinCodeInitial extends PinCodeState {}

mixin PinCodeMismatch on PinCodeState {}

mixin PinCodeFailure on PinCodeState {}

mixin PinCodeFieldReset on PinCodeState {}

class PinCodeSignInInitial extends PinCodeState with PinCodeFieldReset {
  PinCodeSignInInitial(this.pinCode);

  final String pinCode;
}

class PinCodeSignInConfirmFailure extends PinCodeSignInInitial
    with PinCodeFailure {
  PinCodeSignInConfirmFailure(super.pinCode);
}

class PinCodeSignInConfirmMismatch extends PinCodeSignInInitial
    with PinCodeMismatch {
  PinCodeSignInConfirmMismatch(super.pinCode);
}

class PinCodeSignInConfirmSuccess extends PinCodeState {}

class PinCodeResetSuccess extends PinCodeSignUpInitial with PinCodeFieldReset {}

class PinCodeResetFailure extends PinCodeState with PinCodeFailure {}

class PinCodeSignUpInitial extends PinCodeState with PinCodeFieldReset {}

class PinCodeSignUpEnterSuccess extends PinCodeState with PinCodeFieldReset {
  PinCodeSignUpEnterSuccess(this.pinCode);

  final String pinCode;
}

class PinCodeSignUpConfirmMismatch extends PinCodeSignUpEnterSuccess
    with PinCodeMismatch {
  PinCodeSignUpConfirmMismatch(super.pinCode);
}

class PinCodeSignUpConfirmFailure extends PinCodeSignUpEnterSuccess
    with PinCodeFailure {
  PinCodeSignUpConfirmFailure(super.pinCode);
}

class PinCodeSignUpConfirmSuccess extends PinCodeState {}

class PinCodeChangePreviousInitial extends PinCodeState with PinCodeFieldReset {
  PinCodeChangePreviousInitial(this.pinCode);

  final String pinCode;
}

class PinCodeChangePreviousMismatch extends PinCodeChangePreviousInitial
    with PinCodeMismatch {
  PinCodeChangePreviousMismatch(super.pinCode);
}

class PinCodeChangeInitial extends PinCodeState with PinCodeFieldReset {}

class PinCodeChangeEnterSuccess extends PinCodeState with PinCodeFieldReset {
  PinCodeChangeEnterSuccess(this.pinCode);

  final String pinCode;
}

class PinCodeChangeConfirmFailure extends PinCodeChangeEnterSuccess
    with PinCodeFailure {
  PinCodeChangeConfirmFailure(super.pinCode);
}

class PinCodeChangeConfirmMismatch extends PinCodeChangeEnterSuccess
    with PinCodeMismatch {
  PinCodeChangeConfirmMismatch(super.pinCode);
}

class PinCodeChangeConfirmSuccess extends PinCodeState {}
