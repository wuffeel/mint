import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../bloc/auth/auth_bloc.dart';
import '../../../../gen/colors.gen.dart';

@RoutePage()
class PinCodeWrapperPage extends AutoRouter with AutoRouteWrapper {
  const PinCodeWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthPhoneVerificationFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.somethingWentWrongSendingCode),
                backgroundColor: MintColors.error,
              ),
            );
          }
          if (state is AuthPhoneVerificationTooManyRequests) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(context.l10n.tooMuchRequests),
                backgroundColor: MintColors.error,
              ),
            );
          }
        },
        child: this,
      ),
    );
  }
}
