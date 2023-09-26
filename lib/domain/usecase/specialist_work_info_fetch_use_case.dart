import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';
import 'package:mint_core/mint_core.dart';

@injectable
class SpecialistWorkInfoFetchUseCase {
  SpecialistWorkInfoFetchUseCase(this._service);

  final BookingService _service;

  Future<SpecialistWorkInfo> call(String specialistId) {
    return _service.getSpecialistWorkInfo(specialistId);
  }
}
