import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

import '../entity/specialist_model/specialist_model.dart';

@injectable
class FetchSpecialistUseCase {
  FetchSpecialistUseCase(this._service);

  final SpecialistService _service;

  Future<SpecialistModel?> call(String specialistId) =>
      _service.getSpecialist(specialistId);
}
