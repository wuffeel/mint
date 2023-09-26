import 'package:mint_core/mint_core.dart';

import '../../model/booking_data_dto/booking_data_dto.dart';

abstract class BookingRepository {
  Future<SpecialistWorkInfoDto> getSpecialistWorkInfo(String specialistId);

  Future<BookingDataDto> bookSpecialist(BookingDataDto bookingData);

  Future<void> bookReschedule(BookingDataDto newBookingData);

  Future<void> cancelBooking(String bookingId);

  Future<List<BookingDataDto>> getUpcomingSessions(String userId);

  Future<List<BookingDataDto>> getPreviousSessions(
    String userId, {
    String? lastBookingId,
    int? limit,
  });

  Future<BookingDataDto?> getSession(String bookingId);
}
