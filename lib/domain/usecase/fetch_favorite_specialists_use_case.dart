import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';
import 'package:mint_core/mint_core.dart';

@injectable
class FetchFavoriteSpecialistsUseCase {
  FetchFavoriteSpecialistsUseCase(this._service);

  final SpecialistService _service;

  Future<List<SpecialistModel>> call(List<String> favoriteIds) =>
      _service.getFavoriteSpecialists(favoriteIds);
}
