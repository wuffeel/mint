import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/auth/otp_page/widgets/otp_code_field.dart';
import 'package:mint/presentation/pages/auth/otp_page/widgets/otp_code_sent_text.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.phoneNumber});

  final String phoneNumber;

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _otpController = TextEditingController();

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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.paddingOf(context).top + 132.h),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(l10n.enterCode, style: MintTextStyles.largeTitle),
                        SizedBox(height: 2.h),
                        OtpCodeSentText(phoneNumber: widget.phoneNumber),
                        SizedBox(height: 20.h),
                        OtpCodeField(controller: _otpController, length: 6),
                      ],
                    ),
                  ),
                  const Spacer(),
                  SizedBox(height: 20.h),
                  InkWell(
                    child: Text(
                      l10n.resendCode,
                      style: MintTextStyles.buttonsHuge.copyWith(
                        color: MintColors.primaryBlueColor,
                      ),
                    ),
                  ),
                  SizedBox(height: 37.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
