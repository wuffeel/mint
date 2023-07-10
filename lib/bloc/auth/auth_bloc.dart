import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/user_controller.dart';
import 'package:mint/domain/entity/phone_code_sent_data.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';
import 'package:mint/domain/usecase/verify_otp_use_case.dart';
import 'package:mint/domain/usecase/verify_phone_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._verifyPhoneUseCase,
    this._verifyOtpUseCase,
    this._userController,
  ) : super(AuthInitial()) {
    _subscribeToUserChange();
    on<AuthPhoneVerificationRequested>(
      _onPhoneVerificationRequested,
      transformer: droppable(),
    );
    on<AuthOtpVerificationRequested>(
      _onOtpVerificationRequested,
      transformer: droppable(),
    );
    on<AuthOtpResendRequested>(
      _onOtpResendRequested,
      transformer: droppable(),
    );
    on<AuthForgotPinRequested>(
      _onForgotPinRequested,
      transformer: droppable(),
    );
  }

  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

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

  Future<void> _onPhoneVerificationRequested(
    AuthPhoneVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthPhoneVerificationLoading());
    try {
      final phoneCodeSentData = await _verifyPhoneUseCase(
        phoneNumber: event.phoneNumber,
      );
      emit(AuthPhoneVerificationSuccess(event.phoneNumber, phoneCodeSentData));
    } catch (error) {
      log('PhoneVerificationFailure: $error');
      if (error.toString().contains('invalid-phone-number')) {
        emit(AuthPhoneVerificationInvalidPhone());
      } else if (error.toString().contains('too-many-requests')) {
        emit(AuthPhoneVerificationTooManyRequests());
      } else {
        emit(AuthPhoneVerificationFailure());
      }
    }
  }

  Future<void> _onOtpVerificationRequested(
    AuthOtpVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    final localState = state;
    if (localState is! AuthPhoneVerificationSuccess) return;

    emit(
      AuthOtpVerificationLoading(
        localState.phoneNumber,
        localState.phoneCodeSentData,
      ),
    );

    try {
      await _verifyOtpUseCase(
        otpCode: event.otpCode,
        verificationId: localState.phoneCodeSentData.verificationId,
      );
      emit(AuthOtpVerificationSuccess());
    } catch (error) {
      log('OtpVerificationError: $error');
      if (error.toString().contains('invalid-verification-code')) {
        emit(
          AuthOtpVerificationMismatch(
            localState.phoneNumber,
            localState.phoneCodeSentData,
          ),
        );
      } else {
        emit(
          AuthOtpVerificationFailure(
            localState.phoneNumber,
            localState.phoneCodeSentData,
          ),
        );
      }
    }
  }

  Future<void> _onOtpResendRequested(
    AuthOtpResendRequested event,
    Emitter<AuthState> emit,
  ) async {
    final localState = state;
    if (localState is! AuthPhoneVerificationSuccess) return;

    emit(
      AuthOtpResendLoading(
        localState.phoneNumber,
        localState.phoneCodeSentData,
      ),
    );

    try {
      final phoneCodeSentData = await _verifyPhoneUseCase(
        phoneNumber: localState.phoneNumber,
        resendToken: localState.phoneCodeSentData.resendToken,
      );
      emit(AuthOtpResendSuccess(localState.phoneNumber, phoneCodeSentData));
    } catch (error) {
      log('OtpResendFailure: $error');
      emit(
        AuthOtpResendFailure(
          localState.phoneNumber,
          localState.phoneCodeSentData,
        ),
      );
    }
  }

  Future<void> _onForgotPinRequested(
    AuthForgotPinRequested event,
    Emitter<AuthState> emit,
  ) async {
    final user = _currentUser;
    final phoneNumber = user?.phoneNumber;
    if (user == null || phoneNumber == null) return;

    emit(AuthForgotPinLoading());
    try {
      final phoneCodeSentData = await _verifyPhoneUseCase(
        phoneNumber: phoneNumber,
      );
      emit(AuthPhoneVerificationSuccess(phoneNumber, phoneCodeSentData));
    } catch (error) {
      log('ForgotPinPhoneFailure: $error');
      if (error.toString().contains('too-many-requests')) {
        emit(AuthPhoneVerificationTooManyRequests());
      } else {
        emit(AuthPhoneVerificationFailure());
      }
    }
  }
}
