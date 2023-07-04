import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/user_controller.dart';
import 'package:mint/domain/entity/user_model.dart';
import 'package:mint/domain/usecase/pin_code_change_use_case.dart';

part 'pin_code_event.dart';

part 'pin_code_state.dart';

@injectable
class PinCodeBloc extends Bloc<PinCodeEvent, PinCodeState> {
  PinCodeBloc(
    this._userController,
    this._pinCodeChangeUseCase,
  ) : super(PinCodeInitial()) {
    _subscribeToUserChange();
    on<PinCodeExistCheckRequested>(_onPinCodeExistCheck);
    on<PinCodeEntered>(_onPinCodeEntered);
    on<PinCodeSignInRequested>(_onSignInInitial);
    on<PinCodeSignInConfirmRequested>(_onSignInCodeConfirm);
    on<PinCodeResetRequested>(_onPinCodeReset);
    on<PinCodeSignUpRequested>((event, emit) => emit(PinCodeSignUpInitial()));
    on<PinCodeSignUpEntered>(
      (event, emit) => emit(PinCodeSignUpEnterSuccess(event.pinCode)),
    );
    on<PinCodeSignUpConfirmRequested>(_onSignUpCodeConfirm);
    on<PinCodeChangeRequested>(_onPinChangePreviousInitial);
    on<PinCodeChangePreviousConfirmRequested>(_onPinChangePreviousConfirm);
    on<PinCodeChangeEntered>(
      (event, emit) => emit(PinCodeChangeEnterSuccess(event.pinCode)),
    );
    on<PinCodeChangeOtherRequested>(
      (event, emit) => emit(PinCodeChangeInitial()),
    );
    on<PinCodeChangeConfirmRequested>(_onPinChangeCodeConfirm);
  }

  final PinCodeChangeUseCase _pinCodeChangeUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  void _onPinCodeExistCheck(
    PinCodeExistCheckRequested event,
    Emitter<PinCodeState> emit,
  ) {
    final user = _currentUser;
    if (user == null) return;

    final pin = user.pinCode;
    pin != null ? add(PinCodeSignInRequested()) : add(PinCodeSignUpRequested());
  }

  void _onPinCodeEntered(
    PinCodeEntered event,
    Emitter<PinCodeState> emit,
  ) {
    if (state is PinCodeSignInInitial) {
      add(PinCodeSignInConfirmRequested(event.pinCode));
    } else if (state is PinCodeSignUpInitial) {
      add(PinCodeSignUpEntered(event.pinCode));
    } else if (state is PinCodeSignUpEnterSuccess) {
      add(PinCodeSignUpConfirmRequested(event.pinCode));
    } else if (state is PinCodeChangePreviousInitial) {
      add(PinCodeChangePreviousConfirmRequested(event.pinCode));
    } else if (state is PinCodeChangeInitial) {
      add(PinCodeChangeEntered(event.pinCode));
    } else if (state is PinCodeChangeEnterSuccess) {
      add(PinCodeChangeConfirmRequested(event.pinCode));
    }
  }

  void _onSignInInitial(
    PinCodeSignInRequested event,
    Emitter<PinCodeState> emit,
  ) {
    final user = _currentUser;
    final pin = user?.pinCode;
    if (user == null || pin == null) return;
    emit(PinCodeSignInInitial(pin));
  }

  Future<void> _onSignInCodeConfirm(
    PinCodeSignInConfirmRequested event,
    Emitter<PinCodeState> emit,
  ) async {
    final user = _currentUser;
    final localState = state;
    if (localState is! PinCodeSignInInitial || user == null) return;

    try {
      if (localState.pinCode == event.confirmPin) {
        await _pinCodeChangeUseCase(user.id, event.confirmPin);
        emit(PinCodeSignInConfirmSuccess());
      } else {
        emit(PinCodeSignInConfirmMismatch(localState.pinCode));
      }
    } catch (error) {
      emit(PinCodeSignInConfirmFailure(localState.pinCode));
    }
  }

  Future<void> _onPinCodeReset(
    PinCodeResetRequested event,
    Emitter<PinCodeState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      await _pinCodeChangeUseCase(user.id, null);
      emit(PinCodeResetSuccess());
    } catch (_) {
      emit(PinCodeResetFailure());
    }
  }

  Future<void> _onSignUpCodeConfirm(
    PinCodeSignUpConfirmRequested event,
    Emitter<PinCodeState> emit,
  ) async {
    final user = _currentUser;
    final localState = state;
    if (localState is! PinCodeSignUpEnterSuccess || user == null) return;

    try {
      if (localState.pinCode == event.confirmPin) {
        await _pinCodeChangeUseCase(user.id, event.confirmPin);
        emit(PinCodeSignUpConfirmSuccess());
      } else {
        emit(PinCodeSignUpConfirmMismatch(localState.pinCode));
      }
    } catch (error) {
      emit(PinCodeSignUpConfirmFailure(localState.pinCode));
    }
  }

  void _onPinChangePreviousInitial(
    PinCodeChangeRequested event,
    Emitter<PinCodeState> emit,
  ) {
    final user = _currentUser;
    final pin = user?.pinCode;
    if (user == null || pin == null) return;
    emit(PinCodeChangePreviousInitial(pin));
  }

  void _onPinChangePreviousConfirm(
    PinCodeChangePreviousConfirmRequested event,
    Emitter<PinCodeState> emit,
  ) {
    final localState = state;
    if (localState is! PinCodeChangePreviousInitial) return;

    localState.pinCode == event.confirmPin
        ? emit(PinCodeChangeInitial())
        : emit(PinCodeChangePreviousMismatch(localState.pinCode));
  }

  Future<void> _onPinChangeCodeConfirm(
    PinCodeChangeConfirmRequested event,
    Emitter<PinCodeState> emit,
  ) async {
    final user = _currentUser;
    final localState = state;
    if (localState is! PinCodeChangeEnterSuccess || user == null) return;

    try {
      if (localState.pinCode == event.confirmPin) {
        await _pinCodeChangeUseCase(user.id, event.confirmPin);
        emit(PinCodeChangeConfirmSuccess());
      } else {
        emit(PinCodeChangeConfirmMismatch(localState.pinCode));
      }
    } catch (error) {
      emit(PinCodeChangeConfirmFailure(localState.pinCode));
    }
  }
}
