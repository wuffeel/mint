import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';
import 'package:mint_core/mint_core.dart';

@injectable
class FetchSpecialistsOnlineUseCase {
  FetchSpecialistsOnlineUseCase(this._service);

  final SpecialistService _service;

  Future<List<SpecialistModel>> call({String? lastSpecialistId, int? limit}) =>
      _service.getSpecialistsOnline(
        lastSpecialistId: lastSpecialistId,
        limit: limit,
      );
}
