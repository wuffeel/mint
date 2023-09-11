import 'package:mint/domain/entity/review_model/review_model.dart';
import 'package:mint_core/mint_core.dart';

import '../../entity/filter_preferences/filter_preferences.dart';

abstract class SpecialistService {
  Future<SpecialistModel?> getSpecialist(String specialistId);

  Future<List<SpecialistModel>> getSpecialistsOnline({
    String? lastSpecialistId,
    int? limit,
  });

  Future<List<SpecialistModel>> getFavoriteSpecialists(
    String userId, {
    String? lastSpecialistId,
    int? limit,
  });

  Future<void> addToFavorite(String userId, String specialistId);

  Future<void> removeFromFavorite(String userId, String specialistId);

  Future<List<SpecialistModel>> getSpecialistCatalogue(
    FilterPreferences filter, {
    String? lastSpecialistId,
    int? limit,
  });

  Future<List<ReviewModel>> getSpecialistReviews(String specialistId);

  Future<ReviewModel> addSpecialistReview(ReviewModel reviewModel);

  Future<void> updateSpecialistReview(ReviewModel reviewModel);

  Future<void> deleteSpecialistReview(ReviewModel reviewModel);
}
