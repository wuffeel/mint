part of 'app_notifications_bloc_patient.dart';

class AppNotificationsFetchBookingDataSuccess extends AppNotificationsState {
  AppNotificationsFetchBookingDataSuccess(this.bookingData);

  final BookingData bookingData;
}

class AppNotificationsFetchBookingDataFailure extends AppNotificationsState {}
