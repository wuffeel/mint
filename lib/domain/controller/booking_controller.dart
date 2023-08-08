import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';

@lazySingleton
class BookingController {
  final _newBookingController = StreamController<BookingData>.broadcast();
  final _rescheduleController = StreamController<BookingData>.broadcast();
  final _cancelBookingController = StreamController<String>.broadcast();

  Stream<BookingData> get newBooking => _newBookingController.stream;

  Stream<BookingData> get rescheduleBooking => _rescheduleController.stream;

  Stream<String> get cancelBooking => _cancelBookingController.stream;

  void addToNewBookingStream(BookingData bookingData) =>
      _newBookingController.add(bookingData);

  void addToRescheduleBookingStream(BookingData bookingData) =>
      _rescheduleController.add(bookingData);

  void addToCancelBookingStream(String bookingId) =>
      _cancelBookingController.add(bookingId);
}
