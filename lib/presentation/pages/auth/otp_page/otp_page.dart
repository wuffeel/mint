import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/auth/otp_page/widgets/otp_code_field.dart';
import 'package:mint/presentation/pages/auth/otp_page/widgets/otp_code_sent_text.dart';
import 'package:mint/presentation/widgets/loading_indicator.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController();

  /// Flag used to display a resend code button
  bool _resendCodeEnabled = false;

  late Timer _timer;
  late Duration _countdownDuration;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  /// Listens to resend code event to reset a [_timer]
  void _authListener(AuthState state) {
    if (state is AuthOtpResendSuccess) {
      setState(() {
        _resendCodeEnabled = false;
        if (_timer.isActive) _stopCountdown();
        _startCountdown();
      });
    }
  }

  /// Launch [otpCode] verification with AuthBloc
  void _verifyOtp(String otpCode) {
    context.read<AuthBloc>().add(AuthOtpVerificationRequested(otpCode));
  }

  /// Launch code resend with AuthBloc
  void _resendCode() {
    context.read<AuthBloc>().add(AuthOtpResendRequested());
  }

  /// Starts the countdown [_timer] for [_countdownDuration]
  void _startCountdown() {
    _countdownDuration = const Duration(minutes: 1);
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        final seconds = _countdownDuration.inSeconds - 1;
        if (seconds <= 0) {
          _stopCountdown();
          _resendCodeEnabled = true;
        } else {
          _countdownDuration = Duration(seconds: seconds);
        }
      });
    });
  }

  /// Stop countdown [_timer]
  void _stopCountdown() => _timer.cancel();

  String strDigits(int n) => n.toString().padLeft(2, '0');

  /// Get a time left String to resend a code
  String _getResendRemainingTime(AppLocalizations l10n) {
    final minutes = strDigits(_countdownDuration.inMinutes.remainder(60));
    final seconds = strDigits(_countdownDuration.inSeconds.remainder(60));
    return '${l10n.youWillBeAbleToResendIn} $minutes:$seconds';
  }

  String _getErrorText(AuthState state) {
    if (state is AuthOtpVerificationMismatch) {
      return context.l10n.wrongVerificationCode;
    } else if (state is AuthOtpVerificationFailure) {
      return context.l10n.somethingWentWrongTryAgain;
    }
    return '';
  }

  @override
  void dispose() {
    _otpController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: const MintAppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) => _authListener(state),
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.paddingOf(context).top + 132.h,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              l10n.enterCode,
                              style: MintTextStyles.largeTitle,
                            ),
                            SizedBox(height: 2.h),
                            if (state is AuthPhoneVerificationSuccess)
                              OtpCodeSentText(phoneNumber: state.phoneNumber),
                            SizedBox(height: 20.h),
                            OtpCodeField(
                              controller: _otpController,
                              length: 6,
                              isError: state is AuthOtpVerificationFailure,
                              onCompleted: _verifyOtp,
                            ),
                            if (state is AuthOtpVerificationLoading)
                              const Center(child: LoadingIndicator())
                            else if (!_resendCodeEnabled) ...[
                              SizedBox(height: 32.h),
                              Text(
                                _getResendRemainingTime(l10n),
                                style: MintTextStyles.caption1.copyWith(
                                  color: Theme.of(context)
                                      .hintColor
                                      .withOpacity(0.6),
                                ),
                              )
                            ],
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(height: 20.h),
                      if (state is AuthOtpVerificationFailure ||
                          state is AuthOtpVerificationMismatch) ...[
                        Text(
                          _getErrorText(state),
                          style: MintTextStyles.buttonsHuge.copyWith(
                            color: MintColors.error,
                          ),
                        ),
                        SizedBox(height: 10.h),
                      ],
                      if (state is AuthOtpResendLoading)
                        const Center(child: LoadingIndicator())
                      else if (!_resendCodeEnabled ||
                          state is AuthOtpVerificationLoading)
                        const SizedBox.shrink()
                      else
                        InkWell(
                          onTap: _resendCode,
                          child: Text(
                            l10n.resendCode,
                            style: MintTextStyles.buttonsHuge.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                      SizedBox(height: 37.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
