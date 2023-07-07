import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class ForgotPinOtpWrapperPage extends StatelessWidget
    implements AutoRouteWrapper {
  const ForgotPinOtpWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthPhoneVerificationSuccess) {
              context.router.navigate(const OtpRoute());
            }
            if (state is AuthPhoneVerificationFailure) {
              context.router.pop();
            }
            if (state is AuthOtpVerificationSuccess) {
              context.read<PinCodeBloc>().add(PinCodeResetRequested());
            }
          },
        ),
        BlocListener<PinCodeBloc, PinCodeState>(
          listener: (context, state) {
            if (state is PinCodeResetSuccess) {
              context.router.pop();
            }
          },
        )
      ],
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthForgotPinLoading) {
          return const Scaffold(
            appBar: MintAppBar(),
            body: Center(child: CircularProgressIndicator()),
          );
        }
        return const AutoRouter();
      },
    );
  }
}
