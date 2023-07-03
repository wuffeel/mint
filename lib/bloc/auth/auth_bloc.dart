import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/phone_code_sent_data.dart';
import 'package:mint/domain/service/abstract/phone_auth_service.dart';

part 'auth_event.dart';

part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._phoneAuthService) : super(AuthInitial()) {
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

  final PhoneAuthService _phoneAuthService;

  Future<void> _onPhoneVerificationRequested(
    AuthPhoneVerificationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthPhoneVerificationLoading());
    try {
      final phoneCodeSentData = await _phoneAuthService.verifyPhoneNumber(
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
      await _phoneAuthService.verifyOtpCode(
        otpCode: event.otpCode,
        verificationId: localState.phoneCodeSentData.verificationId,
      );
      emit(AuthOtpVerificationSuccess());
    } catch (error) {
      if (error.toString().contains('invalid-verification-code')) {
        emit(
          AuthOtpVerificationFailure(
            'Wrong verification code',
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
      final phoneCodeSentData = await _phoneAuthService.verifyPhoneNumber(
        phoneNumber: event.phoneNumber,
        resendToken: localState.phoneCodeSentData.resendToken,
      );
      emit(AuthPhoneVerificationSuccess(event.phoneNumber, phoneCodeSentData));
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
