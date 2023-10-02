import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/injector/injector.dart';
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

  void _appNotificationsBlocListener(BuildContext context,
      AppNotificationsState state,) {
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
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AppNotificationsBlocPatient>(),
      child: BlocListener<AppNotificationsBlocPatient, AppNotificationsState>(
        listener: _appNotificationsBlocListener,
        child: const _NotificationsView(),
      ),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: MintAppBar(
        centerTitle: true,
        title: Text(l10n.notifications, style: MintTextStyles.title2),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              // TODO(wuffeel): add onClear callback
            },
            style: TextButton.styleFrom(
              foregroundColor: Theme
                  .of(context)
                  .primaryColor,
            ),
            child: Text(l10n.clear),
          ),
        ],
      ),
      body: BlocBuilder<AppNotificationsBlocPatient, AppNotificationsState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              BlocBuilder<AppNotificationsBlocPatient, AppNotificationsState>(
                builder: (context, state) {
                  if (state is AppNotificationsFetchSuccess) {
                    final todayNotifications = state.todayNotifications;
                    final previousNotifications = state.previousNotifications;
                    if (todayNotifications.isEmpty &&
                        previousNotifications.isEmpty) {
                      return SliverFillRemaining(
                        hasScrollBody: false,
                        child: Center(
                          child: Text(
                            context.l10n.youDoNotHaveAnyNotifications,
                          ),
                        ),
                      );
                    }
                    if (todayNotifications.isNotEmpty) {
                      return _NotificationGroupList(
                        groupTitle: l10n.today,
                        notificationList: todayNotifications,
                      );
                    }
                    if (previousNotifications.isNotEmpty) {
                      return _NotificationGroupList(
                        groupTitle: l10n.previous,
                        notificationList: previousNotifications,
                      );
                    }
                  }
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                },
              ),
            ],
          );
        },
      ),
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
        SliverToBoxAdapter(child: SizedBox(height: 30.h)),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          sliver: SliverToBoxAdapter(
            child: Text(groupTitle, style: MintTextStyles.headline),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 15.h)),
        SliverList.builder(
          itemCount: notificationList.length,
          itemBuilder: (context, index) {
            return NotificationTile(
              notification: notificationList[index],
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 30.w),
            );
          },
        ),
      ],
    );
  }
}
