import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class SignUpWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const SignUpWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<AuthBloc>(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthOtpVerificationSuccess) {
            context.router.root.replace(const NavigationWrapperRoute());
          }
        },
        child: this,
      ),
    );
  }
}