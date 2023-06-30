
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/auth/enter_phone/widgets/enter_phone_sign_in_text.dart';
import 'package:mint/presentation/pages/auth/enter_phone/widgets/enter_phone_terms_text.dart';
import 'package:mint/presentation/pages/auth/enter_phone/widgets/phone_text_field.dart';
import 'package:mint/presentation/widgets/mint_elevated_button.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class EnterPhonePage extends StatefulWidget {
  const EnterPhonePage({super.key});

  @override
  State<EnterPhonePage> createState() => _EnterPhonePageState();
}

class _EnterPhonePageState extends State<EnterPhonePage> {
  final _phoneController = TextEditingController();
  bool _isPhoneValid = false;

  /// Validates the [phoneNumber] with universal phone number regex
  ///
  /// Used to check if "Sign Up" button should be available
  bool _validatePhoneNumber(String phoneNumber) {
    final regex = RegExp(
      r'^\(?(\+[0-9]{1,3})\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}( ?-?[0-9]{3})? ?(\w{1,10}\s?\d{1,6})?$',
    );

    return regex.hasMatch(phoneNumber);
  }

  void _navigateToOtp() {
    context.router.push(OtpRoute(phoneNumber: _phoneController.text));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.paddingOf(context).top + 172.h),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(l10n.signUp, style: MintTextStyles.largeTitle),
                      SizedBox(height: 44.h),
                      PhoneTextField(
                        controller: _phoneController,
                        onChanged: (phoneNumber) {
                          setState(() {
                            _isPhoneValid = _validatePhoneNumber(phoneNumber);
                          });
                        },
                      ),
                      SizedBox(height: 16.h),
                      MintElevatedButton(
                        onPressed: _isPhoneValid ? _navigateToOtp : null,
                        title: l10n.signUp,
                      ),
                      SizedBox(height: 8.h),
                      const Center(child: EnterPhoneTermsText()),
                    ],
                  ),
                  const Spacer(),
                  SizedBox(height: 20.h),
                  const EnterPhoneSignInText(),
                  SizedBox(height: MediaQuery.paddingOf(context).bottom + 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
