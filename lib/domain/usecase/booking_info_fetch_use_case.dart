import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class BookingInfoFetchUseCase {
  BookingInfoFetchUseCase(this._service);

  final BookingService _service;

  Future<SpecialistWorkInfo> call(String specialistId) {
    return _service.getSpecialistBookInfo(specialistId);
  }
}
