import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/notifications/widgets/notification_tile.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../../../../bloc/app_notifications/app_notifications_bloc_patient.dart';
import '../../../widgets/mint_app_bar.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  void _appNotificationsBlocListener(
    BuildContext context,
    AppNotificationsState state,
  ) {
    if (state is AppNotificationsFetchChatRoomSuccess) {
      context.router.replace(
        ChatRoomRoute(room: state.room, senderId: state.senderId),
      );
    }
    if (state is AppNotificationsFetchBookingDataSuccess) {
      context.router.replace(
        SessionDetailsRoute(bookingData: state.bookingData),
      );
    }
    if (state is AppNotificationsFailure) {
      final l10n = context.l10n;
      switch (state.failureState) {
        case AppNotificationsFailureEnum.markAsRead:
          return;
        case AppNotificationsFailureEnum.clear:
        case AppNotificationsFailureEnum.fetchChat:
          _showFailureSnackBar(context, l10n.somethingWentWrongTryAgain);
          break;
        case AppNotificationsFailureEnum.bookingData:
          _showFailureSnackBar(context, l10n.couldNotFindSession);
          break;
      }
    }
  }

  void _showFailureSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(content)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AppNotificationsBlocPatient, AppNotificationsState>(
      listener: _appNotificationsBlocListener,
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  void _markMessagesAsCleared(BuildContext context) {
    context
        .read<AppNotificationsBlocPatient>()
        .add(AppNotificationsClearRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: MintAppBar(
        centerTitle: true,
        title: Text(l10n.notifications, style: MintTextStyles.title2),
        actions: <Widget>[
          TextButton(
            onPressed: () => _markMessagesAsCleared(context),
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            child: Text(l10n.clear),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          const _EmptyNotifications(),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 20.h),
            sliver: MultiSliver(
              children: const [_TodayNotifications(), _PreviousNotifications()],
            ),
          ),
        ],
      ),
    );
  }
}

class _EmptyNotifications extends StatelessWidget {
  const _EmptyNotifications();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppNotificationsBlocPatient, AppNotificationsState,
        bool>(
      selector: (state) =>
          state.todayNotifications.isEmpty &&
          state.previousNotifications.isEmpty,
      builder: (context, isEmpty) => isEmpty
          ? SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  context.l10n.youDoNotHaveAnyNotifications,
                  style: MintTextStyles.body,
                ),
              ),
            )
          : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}

class _TodayNotifications extends StatelessWidget {
  const _TodayNotifications();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<AppNotificationsBlocPatient, AppNotificationsState,
        List<NotificationModel>>(
      selector: (state) => state.todayNotifications,
      builder: (context, todayNotifications) => todayNotifications.isNotEmpty
          ? _NotificationGroupList(
              groupTitle: l10n.today,
              notificationList: todayNotifications,
            )
          : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}

class _PreviousNotifications extends StatelessWidget {
  const _PreviousNotifications();

  EdgeInsetsGeometry _getGroupPadding(BuildContext context) {
    final todayNotifications =
        context.read<AppNotificationsBlocPatient>().state.todayNotifications;
    return todayNotifications.isNotEmpty
        ? EdgeInsets.only(top: 20.h)
        : EdgeInsets.zero;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocSelector<AppNotificationsBlocPatient, AppNotificationsState,
        List<NotificationModel>>(
      selector: (state) => state.previousNotifications,
      builder: (context, previousNotifications) =>
          previousNotifications.isNotEmpty
              ? SliverPadding(
                  padding: _getGroupPadding(context),
                  sliver: _NotificationGroupList(
                    groupTitle: l10n.previous,
                    notificationList: previousNotifications,
                  ),
                )
              : const SliverToBoxAdapter(child: SizedBox.shrink()),
    );
  }
}

class _NotificationGroupList extends StatelessWidget {
  const _NotificationGroupList({
    required this.groupTitle,
    required this.notificationList,
  });

  final String groupTitle;
  final List<NotificationModel> notificationList;

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: <Widget>[
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          sliver: SliverToBoxAdapter(
            child: Text(groupTitle, style: MintTextStyles.headline),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        SliverList.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) => NotificationTile(
            notification: notificationList[index],
            padding: EdgeInsets.only(
              top: 8.h,
              bottom: 8.h,
              left: 30.w,
              right: 14.w,
            ),
          ),
        ),
      ],
    );
  }
}
