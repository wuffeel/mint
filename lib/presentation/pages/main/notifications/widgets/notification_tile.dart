import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/bloc/app_notifications/app_notifications_bloc_patient.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_utils.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    super.key,
    required this.notification,
    this.svgIcon,
    this.padding,
  });

  final NotificationModel notification;
  final SvgGenImage? svgIcon;
  final EdgeInsetsGeometry? padding;

  /// Formats a [DateTime] value into a human-readable string representing the
  /// creation date or time difference from the current time.
  String _getCreatedAtString(BuildContext context, DateTime createdAt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final difference = now.difference(createdAt);

    if (createdAt.isBefore(today)) {
      return _formatDate(context, today, createdAt);
    } else {
      return _formatTimeDifference(context, difference);
    }
  }

  /// Formats a [date] value into a date string, calculating the difference with
  /// [todayDateOnly].
  ///
  /// Date within a week returned as short-weekday (e.g. 'Mon'), otherwise the
  /// full date is returned (e.g. 1/1/2023).
  String _formatDate(
    BuildContext context,
    DateTime todayDateOnly,
    DateTime date,
  ) {
    final locale = context.l10n.localeName;
    if (todayDateOnly.difference(DateTimeUtils.toDateOnly(date)).inDays < 7) {
      return DateFormat.E(locale).format(date);
    } else {
      return DateFormat.yMd(locale).format(date);
    }
  }

  /// Formats a [difference] representing the time difference between two
  /// [DateTime] values into a human-readable string.
  ///
  /// It formats the time difference as either minutes (e.g., "5m"),
  /// hours (e.g. "2h"), or 'Just now' for very recent differences.
  String _formatTimeDifference(BuildContext context, Duration difference) {
    final minutesDifference = difference.inMinutes;
    if (minutesDifference < 1) {
      return context.l10n.justNow;
    } else if (minutesDifference < 60) {
      return '$minutesDifference${'m'}';
    } else {
      return '${difference.inHours}${'h'}';
    }
  }

  void _onNotificationClick(
    BuildContext context,
    NotificationModel notification,
  ) {
    return switch (notification) {
      ChatNotification() => _onChatNotificationClick(context, notification),
      BookingNotification() => _onBookingNotificationClick(
          context,
          notification,
        ),
    };
  }

  void _onChatNotificationClick(
    BuildContext context,
    ChatNotification notification,
  ) {
    final event = AppNotificationsFetchChatRoomRequested(
      notification.id,
      notification.roomId,
    );
    context.read<AppNotificationsBlocPatient>().add(event);
  }

  void _onBookingNotificationClick(
    BuildContext context,
    BookingNotification notification,
  ) {
    final event = AppNotificationsFetchBookingDataRequested(
      notification.id,
      notification.bookingId,
    );
    context.read<AppNotificationsBlocPatient>().add(event);
  }

  @override
  Widget build(BuildContext context) {
    return notification is ChatNotification ||
            notification is BookingNotification
        ? InkWell(
            onTap: () => _onNotificationClick(context, notification),
            child: Padding(
              padding: padding ?? EdgeInsets.zero,
              child: Row(
                children: <Widget>[
                  _NotificationCircleAvatar(
                    svgIcon: svgIcon,
                    photoUrl: notification.photoUrl,
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _NotificationContent(notification: notification),
                        SizedBox(height: 4.h),
                        Text(
                          _getCreatedAtString(context, notification.createdAt),
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Theme.of(context).hintColor.withOpacity(0.6),
                            letterSpacing: -0.25,
                          ),
                        ),
                      ],
                    ),
                  ),
                  _LoadingNotificationWidget(notificationId: notification.id),
                ],
              ),
            ),
          )
        : const SizedBox.shrink();
  }
}

class _NotificationContent extends StatelessWidget {
  const _NotificationContent({required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final notification = this.notification;
    return switch (notification) {
      ChatNotification() => _ChatNotification(notification: notification),
      BookingNotification() => _BookingNotification(notification: notification),
    };
  }
}

class _ChatNotification extends StatelessWidget {
  const _ChatNotification({required this.notification});

  final ChatNotification notification;

  String? get fullName =>
      notification.firstName != null && notification.lastName != null
          ? '${notification.firstName} ${notification.lastName}'
          : null;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final style = TextStyle(fontSize: 14.sp);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${fullName ?? l10n.patient} ',
            style: style.copyWith(fontWeight: FontWeight.w500),
          ),
          TextSpan(text: '${l10n.sentA} ', style: style),
          TextSpan(
            text: l10n.message.toLowerCase(),
            style: style.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _BookingNotification extends StatelessWidget {
  const _BookingNotification({required this.notification});

  final BookingNotification notification;

  String _getBookingDate(BuildContext context, DateTime date) {
    return DateFormat('MMM d, Hm', context.l10n.localeName).format(date);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final style = TextStyle(fontSize: 14.sp);
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(text: '${l10n.youHaveBookedConsultationOn} ', style: style),
          TextSpan(
            text: _getBookingDate(context, notification.createdAt),
            style: style.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class _NotificationCircleAvatar extends StatelessWidget {
  const _NotificationCircleAvatar({this.svgIcon, this.photoUrl});

  final SvgGenImage? svgIcon;
  final String? photoUrl;

  static const double _tileRadius = 24;

  SvgGenImage get _fallBackIcon => Assets.svg.notificationTileIcon;

  @override
  Widget build(BuildContext context) {
    final photoUrl = this.photoUrl;
    final backgroundColor =
        Theme.of(context).colorScheme.primary.withOpacity(0.5);
    return photoUrl != null
        ? CircleAvatar(
            radius: _tileRadius,
            backgroundColor: backgroundColor,
            backgroundImage: NetworkImage(photoUrl),
          )
        : CircleAvatar(
            radius: _tileRadius,
            backgroundColor: backgroundColor,
            child: (svgIcon ?? _fallBackIcon).svg(
              width: 48.w,
              height: 48.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
          );
  }
}

class _LoadingNotificationWidget extends StatelessWidget {
  const _LoadingNotificationWidget({required this.notificationId});

  final String notificationId;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AppNotificationsBlocPatient, AppNotificationsState,
        bool>(
      selector: (state) =>
          state is AppNotificationsMessageLoading &&
          state.notificationId == notificationId,
      builder: (context, isLoading) => isLoading
          ? Row(
              children: <Widget>[
                SizedBox(width: 8.w),
                SizedBox(
                  width: 16.w,
                  height: 16.h,
                  child: const CircularProgressIndicator(
                    strokeWidth: 2,
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
