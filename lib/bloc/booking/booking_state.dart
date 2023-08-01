part of 'booking_bloc.dart';

@immutable
abstract class BookingState {}

class BookingInitial extends BookingState {}

class BookingInfoLoading extends BookingState {}

class BookingInfoFetchSuccess extends BookingState {
  BookingInfoFetchSuccess(this.bookingInfo);

  final SpecialistWorkInfo bookingInfo;
}

class BookingInfoFetchFailure extends BookingState {}

class BookingBookLoading extends BookingState {}

class BookingBookSuccess extends BookingState {
  BookingBookSuccess(this.bookingData);

  final BookingData bookingData;
}

class BookingBookFailure extends BookingState {}

class BookingBookLateFailure extends BookingState {}

class BookingBookDuplicateFailure extends BookingState {}

class BookingRescheduleSuccess extends BookingState {}

class BookingRescheduleFailure extends BookingState {}

class BookingCancelSuccess extends BookingState {}

class BookingCancelFailure extends BookingState {}
