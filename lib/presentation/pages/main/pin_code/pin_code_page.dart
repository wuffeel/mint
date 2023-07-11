import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/backbone/pin_code_status_entered.dart';
import 'package:mint/backbone/pin_code_status_initial.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pin_code/widgets/pin_code_widget.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class PinCodePage extends StatelessWidget {
  const PinCodePage({super.key});

  void _pinCodeListener(BuildContext context, PinCodeState state) {
    if (state is PinCodeSignUpConfirmSuccess ||
        state is PinCodeSignInConfirmSuccess) {
      context.router.replace(const NavigationRoute());
    } else if (state is PinCodeNewConfirmSuccess) {
      context.router.navigate(const NavigationRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PinCodeBloc, PinCodeState>(
      listener: _pinCodeListener,
      child: const _PinCodeView(),
    );
  }
}

class _PinCodeView extends StatefulWidget {
  const _PinCodeView();

  @override
  State<_PinCodeView> createState() => _PinCodeViewState();
}

class _PinCodeViewState extends State<_PinCodeView> {
  /// Calls [PinCodeEntered] event that will call appropriate event considering
  /// current [PinCodeBloc] state
  void _onPinComplete(String pinCode) {
    context.read<PinCodeBloc>().add(PinCodeEntered(pinCode));
  }

  /// Returns a corresponding title according to current PinCodeBloc [state]
  String _getPageTitle(PinCodeState state) {
    final l10n = context.l10n;
    if (state is PinCodeInitial) {
      final status = state.status;
      if (status == PinCodeStatusInitial.signUp ||
          status == PinCodeStatusInitial.changeNew) {
        return l10n.enterNewPinCode;
      }
    }
    if (state is PinCodeEnterSuccess) {
      final status = state.status;

      if (status == PinCodeStatusEntered.signIn) return l10n.enterPinCode;
      if (status == PinCodeStatusEntered.changePrevious) {
        return l10n.enterCurrentPinCode;
      }
      if (status == PinCodeStatusEntered.signUp) return l10n.confirmPinCode;
      if (status == PinCodeStatusEntered.changeNew) {
        return l10n.confirmNewPinCode;
      }
    }
    return '';
  }

  /// Whether to show bottom button according to current PinCodeBloc [state]
  bool _isBottomButtonShown(PinCodeState state) {
    if (state is PinCodeEnterSuccess) {
      final status = state.status;
      if (status == PinCodeStatusEntered.signIn ||
          status == PinCodeStatusEntered.signUp ||
          status == PinCodeStatusEntered.changeNew) {
        return true;
      }
    }

    return false;
  }

  /// Launch a corresponding void callback according to
  /// current PinCodeBloc [state]
  void _getBottomButtonCallback(PinCodeState state) {
    if (state is PinCodeEnterSuccess) {
      if (state.status == PinCodeStatusEntered.signIn) {
        context.read<AuthBloc>().add(AuthForgotPinRequested());
        context.router.push(const ForgotPinOtpWrapperRoute());
      } else if (state.status == PinCodeStatusEntered.signUp) {
        context.read<PinCodeBloc>().add(PinCodeSignUpOtherRequested());
      } else if (state.status == PinCodeStatusEntered.changeNew) {
        context.read<PinCodeBloc>().add(PinCodeChangeOtherRequested());
      }
    }
  }

  /// Returns a corresponding bottom button title according to
  /// current PinCodeBloc [state]
  String _getBottomButtonTitle(PinCodeState state) {
    if (state is PinCodeEnterSuccess) {
      final status = state.status;
      if (state.status == PinCodeStatusEntered.signIn) {
        return context.l10n.forgotPinCode;
      } else if (status == PinCodeStatusEntered.signUp ||
          status == PinCodeStatusEntered.changeNew) {
        return context.l10n.enterOtherPinCode;
      }
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
        child: BlocBuilder<PinCodeBloc, PinCodeState>(
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
