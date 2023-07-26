import '../../entity/booking_data/booking_data.dart';
import '../../entity/specialist_work_info/specialist_work_info.dart';

abstract class BookingService {
  Future<SpecialistWorkInfo> getSpecialistWorkInfo(String specialistId);

  Future<BookingData> bookSpecialist(BookingData bookingData);
}
