import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/notifications/notifications_bloc.dart';
import '../routes/app_router.gr.dart';

class NotificationUtils {
  /// Handles navigation based on the current [NotificationsState]
  /// triggered by pressed notification.
  ///
  /// Returns:
  /// - true, if navigation is handled by notification
  /// - false, if user should be navigated to application home-screen
  static bool navigateByNotification(
    BuildContext context,
    NotificationsState state,
  ) {
    if (state is NotificationsFetchChatRoomSuccess) {
      _navigateToChatRoute(context, state);
      return true;
    } else if (state is NotificationsFetchSessionDataSuccess) {
      _navigateToSessionDetailsRoute(context, state);
      return true;
    }
    return false;
  }

  /// Navigates user to appropriate chat page.
  ///
  /// Resets [NotificationsBloc] state with [_resetNotificationsState]
  static void _navigateToChatRoute(
    BuildContext context,
    NotificationsFetchChatRoomSuccess state,
  ) {
    context.router.replaceAll([
      const NavigationRoute(),
      ChatRoute(
        room: state.chatRoom,
        specialistModel: state.specialistModel,
      ),
    ]);
    _resetNotificationsState(context);
  }

  /// Navigates user to appropriate session details page.
  ///
  /// Resets [NotificationsBloc] state with [_resetNotificationsState]
  static void _navigateToSessionDetailsRoute(
    BuildContext context,
    NotificationsFetchSessionDataSuccess state,
  ) {
    context.router.replaceAll([
      const NavigationRoute(),
      SessionDetailsWrapperRoute(
        children: [
          SessionDetailsRoute(bookingData: state.bookingData),
        ],
      ),
    ]);
    _resetNotificationsState(context);
  }

  /// Resets notifications state to prevent wrong navigation after pin-code
  /// change
  static void _resetNotificationsState(BuildContext context) {
    context.read<NotificationsBloc>().add(NotificationsStateResetRequested());
  }
}
