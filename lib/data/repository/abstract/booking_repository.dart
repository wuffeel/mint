import 'package:mint/data/model/upcoming_consultation_data_dto/upcoming_consultation_data_dto.dart';

import '../../model/booking_data_dto/booking_data_dto.dart';
import '../../model/specialist_work_info_dto/specialist_work_info_dto.dart';

abstract class BookingRepository {
  Future<SpecialistWorkInfoDto> getSpecialistWorkInfo(String specialistId);

  Future<BookingDataDto> bookSpecialist(BookingDataDto bookingData);

  Future<List<UpcomingConsultationDataDto>> getUpcomingConsultations(
    String userId,
  );
}
