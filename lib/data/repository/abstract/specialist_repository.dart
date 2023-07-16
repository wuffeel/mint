import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart';
import 'package:mint/data/model/review_model_dto/review_model_dto.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';

abstract class SpecialistRepository {
  Future<List<SpecialistModelDto>> getSpecialistsOnline();

  Future<List<SpecialistModelDto>> getFavoriteSpecialists(String userId);

  Future<void> addToFavorite(String userId, String specialistId);

  Future<void> removeFromFavorite(String userId, String specialistId);

  Future<List<SpecialistModelDto>> getSpecialistCatalogue(
    FilterPreferencesDto filter,
  );

  Future<List<ReviewModelDto>> getSpecialistReviews(String specialistId);

  Future<void> addSpecialistReview(ReviewModelDto reviewModelDto);
}
