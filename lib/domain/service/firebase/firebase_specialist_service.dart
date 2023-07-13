import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';
import 'package:mint/data/repository/abstract/specialist_repository.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

import '../../../data/model/filter_preferences_dto/filter_preferences_dto.dart';
import '../../entity/filter_preferences/filter_preferences.dart';

@Injectable(as: SpecialistService)
class FirebaseSpecialistService implements SpecialistService {
  FirebaseSpecialistService(
    this._specialistRepository,
    this._specialistModelFromDto,
    this._filterPreferencesToDto,
  );

  final SpecialistRepository _specialistRepository;
  final Factory<Future<SpecialistModel>, SpecialistModelDto>
      _specialistModelFromDto;
  final Factory<FilterPreferencesDto, FilterPreferences>
      _filterPreferencesToDto;

  @override
  Future<List<SpecialistModel>> getSpecialistsOnline() async {
    final specialists = await _specialistRepository.getSpecialistsOnline();
    return Future.wait(specialists.map(_specialistModelFromDto.create));
  }

  @override
  Future<List<SpecialistModel>> getFavoriteSpecialists(String userId) async {
    final favoriteSpecialists =
        await _specialistRepository.getFavoriteSpecialists(userId);
    return Future.wait(favoriteSpecialists.map(_specialistModelFromDto.create));
  }

  @override
  Future<void> addToFavorite(String userId, String specialistId) {
    return _specialistRepository.addToFavorite(userId, specialistId);
  }

  @override
  Future<void> removeFromFavorite(String userId, String specialistId) {
    return _specialistRepository.removeFromFavorite(userId, specialistId);
  }

  @override
  Future<List<SpecialistModel>> getSpecialistCatalogue(
    FilterPreferences filter,
  ) async {
    final filterDto = _filterPreferencesToDto.create(filter);
    final specialistCatalogue =
        await _specialistRepository.getSpecialistCatalogue(filterDto);
    return Future.wait(specialistCatalogue.map(_specialistModelFromDto.create));
  }
}
