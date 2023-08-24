import '../../entity/booking_data/booking_data.dart';
import '../../entity/specialist_work_info/specialist_work_info.dart';

abstract class BookingService {
  Future<SpecialistWorkInfo> getSpecialistWorkInfo(String specialistId);

  Future<BookingData> bookSpecialist(BookingData bookingData);

  Future<void> bookReschedule(BookingData newBookingData);

  Future<void> cancelBooking(String bookingId);

  Future<List<BookingData>> getUpcomingSessions(String userId);

  Future<List<BookingData>> getPreviousSessions(
    String userId, {
    String? lastBookingId,
    int? limit,
  });

  Future<BookingData?> getSession(String bookingId);
}
