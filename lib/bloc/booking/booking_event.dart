part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class BookingWorkInfoRequested extends BookingEvent {
  BookingWorkInfoRequested(this.specialistId);

  final String specialistId;
}

class BookingBookRequested extends BookingEvent {
  BookingBookRequested(
    this.specialistId,
    this.bookTime,
    this.notes,
    this.durationMinutes,
  );

  final String specialistId;
  final DateTime bookTime;
  final String notes;
  final int durationMinutes;
}
