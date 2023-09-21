import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

@injectable
class FetchFavoriteIdsUseCase {
  FetchFavoriteIdsUseCase(this._service);

  final SpecialistService _service;

  Future<List<String>> call(String userId) =>
      _service.getFavoriteSpecialistsIds(userId);
}
