import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

@injectable
class AddToFavoriteUseCase {
  AddToFavoriteUseCase(this._service);

  final SpecialistService _service;

  Future<void> call(
    String userId,
    String specialistId,
  ) =>
      _service.addToFavorite(userId, specialistId);
}
