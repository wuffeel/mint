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
