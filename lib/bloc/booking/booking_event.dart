part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class BookingInfoRequested extends BookingEvent {
  BookingInfoRequested(this.specialistId);

  final String specialistId;
}
