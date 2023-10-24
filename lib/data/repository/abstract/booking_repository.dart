import 'package:mint_core/mint_module.dart';

import '../../model/booking_data_dto/booking_data_dto.dart';

abstract class BookingRepository extends BookingRepositoryBase {
  Future<BookingDataDto> bookSpecialist(BookingDataDto bookingData);

  Future<void> bookReschedule(BookingDataDto newBookingData);

  Future<List<BookingDataDto>> getUpcomingSessions(String userId);

  Future<List<BookingDataDto>> getPreviousSessions(
    String userId, {
    String? lastBookingId,
    int? limit,
  });

  Future<BookingDataDto?> getSession(String bookingId);
}
