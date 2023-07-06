import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto.dart';
import 'package:mint/domain/entity/specialist_model.dart';

@Injectable(as: Factory<SpecialistModel, SpecialistModelDto>)
class SpecialistModelFromDto
    implements Factory<SpecialistModel, SpecialistModelDto> {
  @override
  SpecialistModel create(SpecialistModelDto param) => SpecialistModel(
        param.id,
        param.firstName,
        param.lastName,
        param.price,
        param.rating,
        param.experience,
        param.photoUrl,
      );
}
