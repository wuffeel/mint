import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/auth/otp_page/widgets/otp_code_field.dart';
import 'package:mint/presentation/pages/auth/otp_page/widgets/otp_code_sent_text.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController();

  void _authListener(BuildContext context, AuthState state) {
    if (state is AuthOtpVerificationSuccess) {
      context.router.replaceAll([const NavigationWrapperRoute()]);
    }
  }

  void _verifyOtp(String otpCode) {
    context.read<AuthBloc>().add(AuthOtpVerificationRequested(otpCode));
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: const MintAppBar(),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: _authListener,
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
                              errorText: state is AuthOtpVerificationFailure
                                  ? state.error
                                  : null,
                              onCompleted: _verifyOtp,
                            ),
                            if (state is AuthOtpVerificationLoading)
                              const Center(child: CircularProgressIndicator()),
                          ],
                        ),
                      ),
                      const Spacer(),
                      SizedBox(height: 20.h),
                      if (state is! AuthOtpResendLoading)
                        InkWell(
                          child: Text(
                            l10n.resendCode,
                            style: MintTextStyles.buttonsHuge.copyWith(
                              color: MintColors.primaryBlueColor,
                            ),
                          ),
                        )
                      else
                        const Center(child: CircularProgressIndicator()),
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
