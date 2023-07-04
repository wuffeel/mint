import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';

@RoutePage()
class PinCodeWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const PinCodeWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<PinCodeBloc, PinCodeState>(
        listener: (context, state) {
          if (state is PinCodeSignUpConfirmSuccess ||
              state is PinCodeChangeConfirmSuccess) {
            context.read<UserBloc>().add(UserDataRequested());
          }
        },
        child: this,
      ),
    );
  }
}
