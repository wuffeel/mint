import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/domain/entity/experience_model.dart';
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart';

import '../../data/model/specialist_filter_dto/specialist_filter_dto.dart';

@Injectable(as: Factory<SpecialistFilter, SpecialistFilterDto>)
class SpecialistFilterFromDto
    implements Factory<SpecialistFilter, SpecialistFilterDto> {
  @override
  SpecialistFilter create(SpecialistFilterDto param) {
    final experienceList = param.experience
        .map(ExperienceModel.fromTag)
        .whereType<ExperienceModel>()
        .toList();

    return SpecialistFilter(
      minPrice: param.minPrice,
      maxPrice: param.maxPrice,
      experience: experienceList,
      specializations: [...param.specializations],
    );
  }
}
