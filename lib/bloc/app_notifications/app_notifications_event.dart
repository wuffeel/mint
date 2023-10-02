part of 'app_notifications_bloc_patient.dart';

class AppNotificationsFetchBookingDataRequested extends AppNotificationsEvent {
  AppNotificationsFetchBookingDataRequested(
    this.notificationId,
    this.bookingId,
  );

  final String notificationId;
  final String bookingId;
}
