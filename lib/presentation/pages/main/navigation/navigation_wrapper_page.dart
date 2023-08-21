import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/favorite/favorite_bloc.dart';
import 'package:mint/bloc/notifications/notifications_bloc.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/utils/notification_utils.dart';

import '../../../../backbone/pin_code_status_entered.dart';
import '../../../../backbone/pin_code_status_initial.dart';
import '../../../../bloc/upcoming_sessions/upcoming_sessions_bloc.dart';

@RoutePage()
class NavigationWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const NavigationWrapperPage({super.key});

  void _userBlocListener(BuildContext context, UserState state) {
    if (state is UserLogOutSuccess) {
      context.router.replaceAll([const SignUpWrapperRoute()]);
    }
  }

  /// Updates currently logged-in user pin-code
  void _pinCodeBlocListener(BuildContext context, PinCodeState state) {
    if (state is PinCodeSignUpConfirmSuccess ||
        state is PinCodeNewConfirmSuccess) {
      context.read<UserBloc>().add(UserDataRequested());
    }
  }

  /// Navigates user to appropriate screen by pressed notification.
  ///
  /// If user is currently on pin-code sign-in or sign-up step, navigation
  /// is handled on PinCodePage.
  void _notificationsBlocListener(
    BuildContext context,
    NotificationsState state,
    PinCodeState pinCodeState,
  ) {
    if (_isNavigateByNotification(state) &&
        (!_isPinSignIn(pinCodeState) && !_isPinSignUp(pinCodeState))) {
      NotificationUtils.navigateByNotification(context, state);
    }
  }

  /// Checks if navigation should be handled by notification
  bool _isNavigateByNotification(NotificationsState state) {
    return state is NotificationsFetchChatRoomSuccess ||
        state is NotificationsFetchSessionDataSuccess;
  }

  /// Checks if user is currently on pin-code sign-in screen
  bool _isPinSignIn(PinCodeState state) {
    return state is! PinCodeConfirmed &&
        (state is PinCodeEnterSuccess &&
            state.status == PinCodeStatusEntered.signIn);
  }

  /// Checks if user currently on pin-code sign-up screen
  bool _isPinSignUp(PinCodeState state) {
    return state is! PinCodeConfirmed &&
        ((state is PinCodeInitial &&
                state.status == PinCodeStatusInitial.signUp) ||
            (state is PinCodeEnterSuccess &&
                state.status == PinCodeStatusEntered.signUp));
  }

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
        BlocProvider(
          create: (context) => getIt<UpcomingSessionsBloc>()
            ..add(UpcomingSessionsFetchRequested()),
        ),
        BlocProvider(
          lazy: false,
          create: (context) => getIt<NotificationsBloc>()
            ..add(NotificationsInitializeRequested()),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<UserBloc, UserState>(listener: _userBlocListener),
          BlocListener<PinCodeBloc, PinCodeState>(
            listener: _pinCodeBlocListener,
          ),
        ],
        child: BlocBuilder<PinCodeBloc, PinCodeState>(
          builder: (context, pinCodeState) {
            return BlocListener<NotificationsBloc, NotificationsState>(
              listener: (context, state) =>
                  _notificationsBlocListener(context, state, pinCodeState),
              child: this,
            );
          },
        ),
      ),
    );
  }
}
