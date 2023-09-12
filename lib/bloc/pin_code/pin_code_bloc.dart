import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/backbone/pin_code_status_entered.dart';
import 'package:mint/domain/usecase/pin_code_change_use_case.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../backbone/pin_code_status_initial.dart';

part 'pin_code_event.dart';

part 'pin_code_state.dart';

@injectable
class PinCodeBloc extends Bloc<PinCodeEvent, PinCodeState> {
  PinCodeBloc(
    this._userController,
    this._pinCodeChangeUseCase,
  ) : super(PinCodeInitial(PinCodeStatusInitial.signUp)) {
    _subscribeToUserChange();
    on<PinCodeExistCheckRequested>(_onPinCodeExistCheck);
    on<PinCodeEntered>(_onPinCodeEntered);
    on<PinCodeConfirmRequested>(_onPinCodeConfirmRequest);
    on<PinCodeChangeRequested>(_onPinCodeChangeRequest);
    on<PinCodeResetRequested>(_onPinCodeReset);
    on<PinCodeSignUpOtherRequested>(
      (event, emit) => emit(PinCodeInitial(PinCodeStatusInitial.signUp)),
    );
    on<PinCodeChangeOtherRequested>(
      (event, emit) => emit(PinCodeInitial(PinCodeStatusInitial.changeNew)),
    );
  }

  final PinCodeChangeUseCase _pinCodeChangeUseCase;

  PatientUser? _currentUser;
  final UserController<PatientUser?> _userController;
  late final StreamSubscription<PatientUser?> _userSubscription;

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

  /// Checks if user has the pin-code in database
  void _onPinCodeExistCheck(
    PinCodeExistCheckRequested event,
    Emitter<PinCodeState> emit,
  ) {
    final user = _currentUser;
    if (user == null) return;

    final pin = user.pinCode;
    pin != null
        ? emit(PinCodeEnterSuccess(PinCodeStatusEntered.signIn, pin))
        : emit(PinCodeInitial(PinCodeStatusInitial.signUp));
  }

  /// Called when pin code is entered
  ///
  /// If method called when user is on sign in screen/change-pin previous
  /// check screen, calls confirmation event
  void _onPinCodeEntered(
    PinCodeEntered event,
    Emitter<PinCodeState> emit,
  ) {
    final localState = state;

    if (localState is PinCodeInitial) {
      final status = localState.status;
      if (status == PinCodeStatusInitial.signUp) {
        emit(PinCodeEnterSuccess(PinCodeStatusEntered.signUp, event.pinCode));
      } else if (status == PinCodeStatusInitial.changeNew) {
        emit(
          PinCodeEnterSuccess(PinCodeStatusEntered.changeNew, event.pinCode),
        );
      }
    } else if (localState is PinCodeEnterSuccess) {
      add(PinCodeConfirmRequested(event.pinCode));
    }
  }

  /// Check if previous pin code equal to confirmation pin code
  ///
  /// If equal:
  ///
  /// - if sign in => emit sign confirm state
  /// - if sign up or pin code change => update user's pin code in database
  /// and emit according success state
  ///
  /// If unequal, emit mismatch state
  Future<void> _onPinCodeConfirmRequest(
    PinCodeConfirmRequested event,
    Emitter<PinCodeState> emit,
  ) async {
    final user = _currentUser;
    final localState = state;

    if (localState is! PinCodeEnterSuccess || user == null) return;

    final pin = localState.pinCode;
    final status = localState.status;

    try {
      if (pin == event.pinCode) {
        if (status == PinCodeStatusEntered.signIn) {
          emit(PinCodeSignInConfirmSuccess(status, pin));
          return;
        } else if (status == PinCodeStatusEntered.changePrevious) {
          // If entered pin code matches current pin, let write new pin-code
          emit(PinCodeInitial(PinCodeStatusInitial.changeNew));
          return;
        }

        await _pinCodeChangeUseCase(user.id, pin);

        if (status == PinCodeStatusEntered.signUp) {
          emit(PinCodeSignUpConfirmSuccess(status, pin));
          return;
        } else if (status == PinCodeStatusEntered.changeNew) {
          emit(PinCodeNewConfirmSuccess(status, pin));
          return;
        }
      } else {
        emit(PinCodeMismatch(status, pin));
      }
    } catch (error) {
      log('PinCodeFailure: $error');
      emit(PinCodeFailure(status, localState.pinCode));
    }
  }

  /// Emit state to confirm user's previous pin code
  void _onPinCodeChangeRequest(
    PinCodeChangeRequested event,
    Emitter<PinCodeState> emit,
  ) {
    final user = _currentUser;
    final pin = user?.pinCode;
    if (user == null || pin == null) return;
    emit(PinCodeEnterSuccess(PinCodeStatusEntered.changePrevious, pin));
  }

  /// Reset user's pin code in database
  Future<void> _onPinCodeReset(
    PinCodeResetRequested event,
    Emitter<PinCodeState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    final state = this.state;
    if (state is! PinCodeEnterSuccess) return;

    try {
      await _pinCodeChangeUseCase(user.id, null);
      emit(PinCodeResetSuccess());
    } catch (error) {
      log('PinCodeResetFailure: $error');
      emit(PinCodeResetFailure(state.status, state.pinCode));
    }
  }
}
