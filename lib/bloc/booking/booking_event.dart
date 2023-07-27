part of 'booking_bloc.dart';

@immutable
abstract class BookingEvent {}

class BookingWorkInfoRequested extends BookingEvent {
  BookingWorkInfoRequested(this.specialistId, {this.isReschedule = false});

  final String specialistId;
  final bool isReschedule;
}

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
    this.specialistModel,
    this.bookTime,
    this.notes,
    this.durationMinutes, {
    required this.previousBookingData,
  });

  final SpecialistModel specialistModel;
  final DateTime bookTime;
  final String notes;
  final int durationMinutes;
  final BookingData previousBookingData;
}
