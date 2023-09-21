import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart';
import 'package:mint/data/model/review_model_dto/review_model_dto.dart';
import 'package:mint_core/mint_core.dart';

abstract class SpecialistRepository {
  Future<SpecialistModelDto?> getSpecialist(String specialistId);

  Future<List<SpecialistModelDto>> getSpecialistsOnline({
    String? lastSpecialistId,
    int? limit,
  });

  Future<List<String>> getFavoriteSpecialistsIds(String userId);

  Future<List<SpecialistModelDto>> getFavoriteSpecialists(
    List<String> favoriteIds,
  );

  Future<void> addToFavorite(String userId, String specialistId);

  Future<void> removeFromFavorite(String userId, String specialistId);

  Future<List<SpecialistModelDto>> getSpecialistCatalogue(
    FilterPreferencesDto filter, {
    String? lastSpecialistId,
    int? limit,
  });

  Future<List<ReviewModelDto>> getSpecialistReviews(String specialistId);

  Future<ReviewModelDto> addSpecialistReview(ReviewModelDto reviewModelDto);

  Future<void> updateSpecialistReview(ReviewModelDto reviewModelDto);

  Future<void> deleteSpecialistReview(ReviewModelDto reviewModelDto);
}
