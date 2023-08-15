import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mint/bloc/favorite/favorite_bloc.dart';
import 'package:mint/bloc/notifications/notifications_bloc.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/routes/app_router.gr.dart';

import '../../../../bloc/upcoming_sessions/upcoming_sessions_bloc.dart';

@RoutePage()
class NavigationWrapperPage extends AutoRouter implements AutoRouteWrapper {
  const NavigationWrapperPage({super.key});

  void _userBlocListener(BuildContext context, UserState state) {
    if (state is UserLogOutSuccess) {
      context.router.replaceAll([const SignUpWrapperRoute()]);
    }
  }

  void _pinCodeBlocListener(BuildContext context, PinCodeState state) {
    if (state is PinCodeSignUpConfirmSuccess ||
        state is PinCodeNewConfirmSuccess) {
      context.read<UserBloc>().add(UserDataRequested());
    }
  }

  void _notificationsBlocListener(
    BuildContext context,
    NotificationsState state,
  ) {
    if (state is NotificationsFetchChatRoomSuccess) {
      context.router.navigate(
        ChatRoute(
          room: state.chatRoom,
          specialistModel: state.specialistModel,
        ),
      );
    }
    if (state is NotificationsFetchSessionDataSuccess) {
      context.router.navigate(
        SessionDetailsWrapperRoute(
          children: [
            SessionDetailsRoute(bookingData: state.bookingData),
          ],
        ),
      );
    }
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
          BlocListener<NotificationsBloc, NotificationsState>(
            listener: _notificationsBlocListener,
          ),
        ],
        child: this,
      ),
    );
  }
}
