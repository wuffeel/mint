import 'dart:async';

import 'package:injectable/injectable.dart';

@lazySingleton
class BookingController {
  final _bookingController = StreamController<bool>.broadcast();

  Stream<bool> get bookings => _bookingController.stream;

  void addToBookingsStream({required bool hasChanged}) =>
      _bookingController.add(hasChanged);
}
