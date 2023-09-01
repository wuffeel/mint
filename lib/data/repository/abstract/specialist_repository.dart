import 'package:mint/data/model/filter_preferences_dto/filter_preferences_dto.dart';
import 'package:mint/data/model/review_model_dto/review_model_dto.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';

abstract class SpecialistRepository {
  Future<SpecialistModelDto?> getSpecialist(String specialistId);

  Future<List<SpecialistModelDto>> getSpecialistsOnline({
    String? lastSpecialistId,
    int? limit,
  });

  Future<List<SpecialistModelDto>> getFavoriteSpecialists(
    String userId, {
    String? lastSpecialistId,
    int? limit,
  });

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
