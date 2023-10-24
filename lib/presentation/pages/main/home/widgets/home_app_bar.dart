import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_circle_avatar.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint_core/mint_bloc.dart';

import '../../../../../bloc/app_notifications/app_notifications_bloc_patient.dart';
import '../../../../../routes/app_router.gr.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.photo, this.fullName});

  final String? photo;
  final String? fullName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String _getNameTag(BuildContext context, String? fullName) {
    return fullName != null
        ? fullName.replaceFirst(' ', '-').toLowerCase()
        : context.l10n.patient;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: AppBar(
        title: Row(
          children: <Widget>[
            MintCircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 14.w,
              photoUrl: photo,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                '@${_getNameTag(context, fullName)}',
                style: MintTextStyles.headline1.copyWith(height: 1),
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const NotificationsRoute()),
            icon: const _NotificationBell(),
          ),
        ],
      ),
    );
  }
}

class _NotificationBell extends StatelessWidget {
  const _NotificationBell();

  @override
  Widget build(BuildContext context) {
    final bellWidget = Assets.svg.bellIcon.svg(
      width: 28.w,
      height: 28.h,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        Theme.of(context).brightness == Brightness.dark
            ? MintColors.elementsGreyDark
            : MintColors.grey1,
        BlendMode.srcIn,
      ),
    );

    return BlocBuilder<AppNotificationsBlocPatient, AppNotificationsState>(
      builder: (context, state) {
        if (state.unreadNotificationCount != 0) {
          return Badge(
            backgroundColor: Theme.of(context).colorScheme.primary,
            smallSize: 9,
            label: Text(
              state.unreadNotificationCount.toString(),
              style: const TextStyle(color: Colors.white),
            ),
            child: bellWidget,
          );
        }
        return bellWidget;
      },
    );
  }
}
