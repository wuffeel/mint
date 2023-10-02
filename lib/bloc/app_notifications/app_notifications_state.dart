part of 'app_notifications_bloc_patient.dart';

class AppNotificationsFetchBookingDataSuccess extends AppNotificationsState {
  const AppNotificationsFetchBookingDataSuccess(
    this.bookingData, {
    super.todayNotifications,
    super.previousNotifications,
    super.unreadNotificationCount,
    super.loadingMessageId,
    super.isInitialized,
  });

  final BookingData bookingData;
}
