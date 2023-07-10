import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/favorite/favorite_bloc.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';

@RoutePage()
class NavigationWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const NavigationWrapperPage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<UserBloc>()..add(UserDataListen()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<PinCodeBloc>()..add(PinCodeExistCheckRequested()),
        ),
        BlocProvider(
          create: (context) =>
              getIt<FavoriteBloc>()..add(FavoriteFetchRequested()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserLogOutSuccess) {
                context.router.replaceAll([const SignUpWrapperRoute()]);
              }
            },
          ),
          BlocListener<PinCodeBloc, PinCodeState>(
            listener: (context, state) {
              if (state is PinCodeSignUpConfirmSuccess ||
                  state is PinCodeNewConfirmSuccess) {
                context.read<UserBloc>().add(UserDataRequested());
              }
            },
          ),
        ],
        child: this,
      ),
    );
  }
}
