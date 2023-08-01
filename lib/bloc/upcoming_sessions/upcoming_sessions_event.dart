part of 'upcoming_sessions_bloc.dart';

@immutable
abstract class UpcomingSessionsEvent {}

class UpcomingSessionsFetchRequested extends UpcomingSessionsEvent {}

class UpcomingSessionsBookingAdded extends UpcomingSessionsEvent {
  UpcomingSessionsBookingAdded(this.bookingData);

  final BookingData bookingData;
}

class UpcomingSessionsBookingCancelled extends UpcomingSessionsEvent {
  UpcomingSessionsBookingCancelled(this.bookingId);

  final String bookingId;
}
