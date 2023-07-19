import 'package:mint/domain/entity/specialist_model/specialist_model.dart';

import '../../entity/filter_preferences/filter_preferences.dart';

abstract class SpecialistService {
  Future<List<SpecialistModel>> getSpecialistsOnline();

  Future<List<SpecialistModel>> getFavoriteSpecialists(String userId);

  Future<void> addToFavorite(String userId, String specialistId);

  Future<void> removeFromFavorite(String userId, String specialistId);

  Future<List<SpecialistModel>> getSpecialistCatalogue(
    FilterPreferences filter,
  );
}
