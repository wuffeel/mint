import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

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
