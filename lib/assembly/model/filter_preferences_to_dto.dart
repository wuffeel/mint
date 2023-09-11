import 'package:injectable/injectable.dart';
import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:mint_core/mint_assembly.dart';

@Injectable(as: Factory<FilterPreferencesDto, FilterPreferences>)
class FilterPreferencesToDto
    implements Factory<FilterPreferencesDto, FilterPreferences> {
  @override
  FilterPreferencesDto create(FilterPreferences param) => param.isEmpty
      ? FilterPreferencesDto.empty
      : FilterPreferencesDto(
          lowPrice: param.lowPrice,
          highPrice: param.highPrice,
          experienceFrom: param.experience?.experienceFrom,
          experienceTo: param.experience?.experienceTo,
          specializations: [...?param.specializations],
        );
}
