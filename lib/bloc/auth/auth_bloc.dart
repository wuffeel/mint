import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/phone_code_sent_data.dart';
import 'package:mint/domain/usecase/verify_otp_use_case.dart';
import 'package:mint/domain/usecase/verify_phone_use_case.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._verifyPhoneUseCase,
    this._verifyOtpUseCase,
  ) : super(AuthInitial()) {
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
  }

  final VerifyPhoneUseCase _verifyPhoneUseCase;
  final VerifyOtpUseCase _verifyOtpUseCase;

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
      if (error.toString().contains('invalid-phone-number')) {
        emit(AuthPhoneVerificationFailure('Invalid phone number'));
      } else {
        emit(
          AuthPhoneVerificationFailure(
            'Something went wrong. Please try again',
          ),
        );
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
      if (error.toString().contains('invalid-verification-code')) {
        emit(
          AuthOtpVerificationFailure(
            'Wrong code, please try again',
            localState.phoneNumber,
            localState.phoneCodeSentData,
          ),
        );
      } else {
        emit(
          AuthOtpVerificationFailure(
            'Something went wrong. Please try again',
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
    } catch (_) {
      emit(
        AuthOtpResendFailure(
          'Something went wrong. Please try again',
          localState.phoneNumber,
          localState.phoneCodeSentData,
        ),
      );
    }
  }
}
