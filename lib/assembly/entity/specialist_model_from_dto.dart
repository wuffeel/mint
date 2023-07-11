import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/service/abstract/storage_service.dart';

@Injectable(as: Factory<Future<SpecialistModel>, SpecialistModelDto>)
class SpecialistModelFromDto
    implements Factory<Future<SpecialistModel>, SpecialistModelDto> {
  SpecialistModelFromDto(this._service);

  final StorageService _service;

  @override
  Future<SpecialistModel> create(SpecialistModelDto param) async =>
      SpecialistModel(
        id: param.id,
        firstName: param.firstName,
        lastName: param.lastName,
        price: param.price,
        experience: param.experience,
        rating: param.rating,
        photoUrl: await _service.getSpecialistPhoto(param.photoUrl),
      );
}
