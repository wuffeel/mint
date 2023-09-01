import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

@injectable
class FetchSpecialistCatalogueUseCase {
  FetchSpecialistCatalogueUseCase(this._service);

  final SpecialistService _service;

  Future<List<SpecialistModel>> call(
    FilterPreferences filter, {
    String? lastSpecialistId,
    int? limit,
  }) =>
      _service.getSpecialistCatalogue(
        filter,
        lastSpecialistId: lastSpecialistId,
        limit: limit,
      );
}
