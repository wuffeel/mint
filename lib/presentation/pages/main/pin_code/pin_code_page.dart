import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pin_code/widgets/pin_code_widget.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class PinCodePage extends StatefulWidget {
  const PinCodePage({super.key});

  @override
  State<PinCodePage> createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  void _pinCodePageListener(BuildContext context, PinCodeState state) {
    if (state is PinCodeSignUpConfirmSuccess ||
        state is PinCodeSignInConfirmSuccess) {
      context.router.replace(const NavigationRoute());
    } else if (state is PinCodeChangeConfirmSuccess) {
      context.router.navigate(const NavigationRoute());
    }
  }

  /// Calls [PinCodeEntered] event that will call appropriate event considering
  /// current [PinCodeBloc] state
  void _onPinComplete(String pinCode) {
    context.read<PinCodeBloc>().add(PinCodeEntered(pinCode));
  }

  /// Returns a corresponding title according to current PinCodeBloc [state]
  String _getPageTitle(PinCodeState state) {
    if (state is PinCodeSignInInitial) {
      return context.l10n.enterPinCode;
    } else if (state is PinCodeChangePreviousInitial) {
      return context.l10n.enterCurrentPinCode;
    } else if (state is PinCodeSignUpInitial || state is PinCodeChangeInitial) {
      return context.l10n.enterNewPinCode;
    } else if (state is PinCodeSignUpEnterSuccess) {
      return context.l10n.confirmPinCode;
    } else if (state is PinCodeChangeEnterSuccess) {
      return context.l10n.confirmNewPinCode;
    }
    return '';
  }

  /// Whether to show bottom button according to current PinCodeBloc [state]
  bool _isBottomButtonShown(PinCodeState state) {
    if (state is PinCodeSignInInitial ||
        state is PinCodeSignUpEnterSuccess ||
        state is PinCodeChangeEnterSuccess) return true;
    return false;
  }

  /// Launch a corresponding void callback according to
  /// current PinCodeBloc [state]
  void _getBottomButtonCallback(PinCodeState state) {
    if (state is PinCodeSignInInitial) {
      context.router.push(const ForgotPinOtpWrapperRoute());
    } else if (state is PinCodeSignUpEnterSuccess) {
      context.read<PinCodeBloc>().add(PinCodeSignUpRequested());
    } else if (state is PinCodeChangeEnterSuccess) {
      context.read<PinCodeBloc>().add(PinCodeChangeOtherRequested());
    }
  }

  /// Returns a corresponding bottom button title according to
  /// current PinCodeBloc [state]
  String _getBottomButtonTitle(PinCodeState state) {
    if (state is PinCodeSignInInitial) {
      return context.l10n.forgotPinCode;
    } else if (state is PinCodeSignUpEnterSuccess ||
        state is PinCodeChangeEnterSuccess) {
      return context.l10n.enterOtherPinCode;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const MintAppBar(),
      body: SizedBox(
        width: double.infinity,
        child: BlocConsumer<PinCodeBloc, PinCodeState>(
          listener: _pinCodePageListener,
          builder: (context, state) {
            return Column(
              children: <Widget>[
                SizedBox(height: 165.h),
                Text(
                  _getPageTitle(state),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    height: 1.3,
                  ),
                ),
                SizedBox(height: 8.h),
                PinCodeWidget(length: 4, onCompleted: _onPinComplete),
                const Spacer(),
                if (_isBottomButtonShown(state))
                  InkWell(
                    onTap: () => _getBottomButtonCallback(state),
                    child: Text(
                      _getBottomButtonTitle(state),
                      style: MintTextStyles.buttonsHuge.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                SizedBox(height: 37.h),
              ],
            );
          },
        ),
      ),
    );
  }
}
