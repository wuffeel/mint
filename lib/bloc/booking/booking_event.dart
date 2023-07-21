part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class BookingInfoRequested extends BookingEvent {
  BookingInfoRequested(this.specialistId);

  final String specialistId;
}

class BookingBookRequested extends BookingEvent {
  BookingBookRequested(
    this.specialistId,
    this.selectedDate,
    this.selectedTime,
    this.notes,
  );

  final String specialistId;
  final DateTime selectedDate;
  final DateTime selectedTime;
  final String notes;
}
