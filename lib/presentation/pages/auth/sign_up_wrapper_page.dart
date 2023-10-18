import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/auth/auth_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint_core/mint_bloc.dart';

@RoutePage()
class SignUpWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const SignUpWrapperPage({super.key});

  void _authBlocListener(BuildContext context, AuthState state) {
    if (state is AuthOtpVerificationSuccess) _fetchUser(context);
  }

  void _userBlocListener(BuildContext context, UserState state) {
    if (state is UserAuthenticated) {
      context.router.replace(const NavigationWrapperRoute());
    }
  }

  void _googleAuthBlocListener(BuildContext context, GoogleAuthState state) {
    if (state is GoogleAuthSignInSuccess) _fetchUser(context);
    if (state is GoogleAuthSignInFailure) {
      final l10n = context.l10n;
      switch (state.failure) {
        case GoogleAuthFailure.base:
          _showErrorSnackBar(context, l10n.somethingWentWrongTryAgain);
          break;
        case GoogleAuthFailure.wrongUserType:
          _showErrorSnackBar(context, l10n.accountIsAttachedToOtherUser);
          break;
      }
    }
  }

  void _fetchUser(BuildContext context) {
    context.read<UserBloc>().add(UserLogInCheckRequested());
  }

  void _showErrorSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: const TextStyle(color: Colors.white)),
        backgroundColor: MintColors.error,
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<UserBloc>()),
        BlocProvider(create: (context) => getIt<GoogleAuthBloc>()),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: _authBlocListener),
          BlocListener<UserBloc, UserState>(listener: _userBlocListener),
          BlocListener<GoogleAuthBloc, GoogleAuthState>(
            listener: _googleAuthBlocListener,
          ),
        ],
        child: this,
      ),
    );
  }
}
