import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/filter_service.dart';

import '../entity/specialist_filter/specialist_filter.dart';

@injectable
class FetchSpecialistFilterUseCase {
  FetchSpecialistFilterUseCase(this._service);

  final FilterService _service;

  Future<SpecialistFilter> call() => _service.getSpecialistFilter();
}
