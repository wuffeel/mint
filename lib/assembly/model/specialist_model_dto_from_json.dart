import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto.dart';

@Injectable(as: Factory<SpecialistModelDto, Map<String, dynamic>>)
class SpecialistModelDtoFromJson
    implements Factory<SpecialistModelDto, Map<String, dynamic>> {
  @override
  SpecialistModelDto create(Map<String, dynamic> param) => SpecialistModelDto(
        param['id'] as String,
        param['firstName'] as String,
        param['lastName'] as String,
        param['price'] as num,
        param['rating'] as num,
        param['experience'] as num,
        param['photoUrl'] as String?,
      );
}
