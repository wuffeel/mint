import '../../model/booking_data_dto/booking_data_dto.dart';
import '../../model/specialist_work_info_dto/specialist_work_info_dto.dart';

abstract class BookingRepository {
  Future<SpecialistWorkInfoDto> getSpecialistBookInfo(String specialistId);

  Future<void> bookSpecialist(BookingDataDto bookingData);
}
