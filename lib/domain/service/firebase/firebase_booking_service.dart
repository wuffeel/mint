import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../../data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import '../../entity/booking_data/booking_data.dart';

@Injectable(as: BookingService)
class FirebaseBookingService implements BookingService {
  FirebaseBookingService(
    this._bookingRepository,
    this._specialistWorkInfoFromDto,
    this._bookingDataToDto,
  );

  final BookingRepository _bookingRepository;

  final Factory<SpecialistWorkInfo, SpecialistWorkInfoDto>
      _specialistWorkInfoFromDto;
  final Factory<BookingDataDto, BookingData> _bookingDataToDto;

  @override
  Future<SpecialistWorkInfo> getSpecialistBookInfo(String specialistId) async {
    final workInfoDto = await _bookingRepository.getSpecialistBookInfo(
      specialistId,
    );
    return _specialistWorkInfoFromDto.create(workInfoDto);
  }

  @override
  Future<void> bookSpecialist(BookingData bookingData) {
    return _bookingRepository.bookSpecialist(
      _bookingDataToDto.create(bookingData),
    );
  }
}
