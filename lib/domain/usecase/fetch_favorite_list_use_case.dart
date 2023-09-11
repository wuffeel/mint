import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';
import 'package:mint_core/mint_core.dart';

@injectable
class FetchFavoriteListUseCase {
  FetchFavoriteListUseCase(this._service);

  final SpecialistService _service;

  Future<List<SpecialistModel>> call(String userId) =>
      _service.getFavoriteSpecialists(userId);
}
