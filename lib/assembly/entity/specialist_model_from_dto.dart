import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

@Injectable(as: Factory<SpecialistModel, SpecialistModelDto>)
class SpecialistModelFromDto
    implements Factory<SpecialistModel, SpecialistModelDto> {
  @override
  SpecialistModel create(SpecialistModelDto param) => SpecialistModel(
        id: param.id,
        firstName: param.firstName,
        lastName: param.lastName,
        price: param.price,
        experience: param.experience,
        rating: param.rating,
        photoUrl: param.photoUrl,
      );
}
