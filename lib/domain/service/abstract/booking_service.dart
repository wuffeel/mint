import 'package:mint_core/mint_module.dart';

import '../../entity/booking_data/booking_data.dart';

abstract class BookingService extends BookingServiceBase {
  Future<BookingData> bookSpecialist(BookingData bookingData);

  Future<void> bookReschedule(BookingData newBookingData);

  Future<List<BookingData>> getUpcomingSessions(String userId);

  Future<List<BookingData>> getPreviousSessions(
    String userId, {
    String? lastBookingId,
    int? limit,
  });

  Future<BookingData?> getSession(String bookingId);
}
