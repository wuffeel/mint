import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';

abstract class SpecialistRepository {
  Future<List<SpecialistModelDto>> getSpecialistsOnline();

  Future<List<SpecialistModelDto>> getFavoriteSpecialists(String userId);

  Future<void> addToFavorite(String userId, String specialistId);

  Future<void> removeFromFavorite(String userId, String specialistId);
}
