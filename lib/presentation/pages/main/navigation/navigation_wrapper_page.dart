import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class NavigationWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const NavigationWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UserBloc>()..add(UserDataRequested()),

      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserLogOutSuccess) {
            context.router.replace(const SignUpWrapperRoute());
          }
        },
        child: this,
      ),
    );
  }
}
