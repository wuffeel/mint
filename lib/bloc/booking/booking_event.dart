part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class BookingBookRequested extends BookingEvent {
  BookingBookRequested(
    this.specialistModel,
    this.bookTime,
    this.notes,
    this.durationMinutes,
  );

  final SpecialistModel specialistModel;
  final DateTime bookTime;
  final String notes;
  final int durationMinutes;
}

class BookingRescheduleRequested extends BookingEvent {
  BookingRescheduleRequested(
    this.previousBooking,
    this.bookTime,
    this.notes,
    this.durationMinutes,
  );

  final BookingData previousBooking;
  final DateTime bookTime;
  final String notes;
  final int durationMinutes;
}

class BookingCancelRequested extends BookingEvent {
  BookingCancelRequested(this.bookingId);

  final String bookingId;
}
