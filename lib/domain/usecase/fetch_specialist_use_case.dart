import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';
import 'package:mint_core/mint_core.dart';

@injectable
class FetchSpecialistUseCase {
  FetchSpecialistUseCase(this._service);

  final SpecialistService _service;

  Future<SpecialistModel?> call(String specialistId) =>
      _service.getSpecialist(specialistId);
}
