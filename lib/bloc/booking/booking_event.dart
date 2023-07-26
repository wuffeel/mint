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
    this.selectedDate,
    this.selectedTime,
    this.notes,
    this.durationMinutes,
  );

  final String specialistId;
  final DateTime selectedDate;
  final DateTime selectedTime;
  final String notes;
  final int durationMinutes;
}
