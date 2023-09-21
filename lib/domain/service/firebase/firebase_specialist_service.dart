import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/specialist_repository.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_core.dart';

import '../../../data/model/filter_preferences_dto/filter_preferences_dto.dart';
import '../../../data/model/review_model_dto/review_model_dto.dart';
import '../../entity/filter_preferences/filter_preferences.dart';
import '../../entity/review_model/review_model.dart';

@Injectable(as: SpecialistService)
class FirebaseSpecialistService implements SpecialistService {
  FirebaseSpecialistService(
    this._specialistRepository,
    this._specialistModelFromDto,
    this._filterPreferencesToDto,
    this._reviewModelFromDto,
    this._reviewDtoFromModel,
  );

  final SpecialistRepository _specialistRepository;

  final Factory<Future<SpecialistModel>, SpecialistModelDto>
      _specialistModelFromDto;
  final Factory<FilterPreferencesDto, FilterPreferences>
      _filterPreferencesToDto;
  final Factory<Future<ReviewModel?>, ReviewModelDto> _reviewModelFromDto;
  final Factory<ReviewModelDto, ReviewModel> _reviewDtoFromModel;

  @override
  Future<SpecialistModel?> getSpecialist(String specialistId) async {
    final specialist = await _specialistRepository.getSpecialist(specialistId);
    if (specialist == null) return null;
    return _specialistModelFromDto.create(specialist);
  }

  @override
  Future<List<SpecialistModel>> getSpecialistsOnline({
    String? lastSpecialistId,
    int? limit,
  }) async {
    final specialists = await _specialistRepository.getSpecialistsOnline(
      lastSpecialistId: lastSpecialistId,
      limit: limit,
    );
    return Future.wait(specialists.map(_specialistModelFromDto.create));
  }

  @override
  Future<List<String>> getFavoriteSpecialistsIds(String userId) async {
    return _specialistRepository.getFavoriteSpecialistsIds(userId);
  }

  @override
  Future<List<SpecialistModel>> getFavoriteSpecialists(
    List<String> favoriteIds,
  ) async {
    final favoriteSpecialists =
        await _specialistRepository.getFavoriteSpecialists(favoriteIds);
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
    FilterPreferences filter, {
    String? lastSpecialistId,
    int? limit,
  }) async {
    final filterDto = _filterPreferencesToDto.create(filter);
    final specialistCatalogue =
        await _specialistRepository.getSpecialistCatalogue(
      filterDto,
      lastSpecialistId: lastSpecialistId,
      limit: limit,
    );
    return Future.wait(specialistCatalogue.map(_specialistModelFromDto.create));
  }

  @override
  Future<List<ReviewModel>> getSpecialistReviews(String specialistId) async {
    final reviewsDto = await _specialistRepository.getSpecialistReviews(
      specialistId,
    );
    final reviews = reviewsDto.map(_reviewModelFromDto.create);
    final reviewList = await Future.wait(reviews);
    return reviewList.whereType<ReviewModel>().toList();
  }

  @override
  Future<ReviewModel> addSpecialistReview(ReviewModel reviewModel) async {
    final review = await _specialistRepository.addSpecialistReview(
      _reviewDtoFromModel.create(reviewModel),
    );
    return reviewModel.copyWith(id: review.id);
  }

  @override
  Future<void> updateSpecialistReview(ReviewModel reviewModel) {
    return _specialistRepository.updateSpecialistReview(
      _reviewDtoFromModel.create(reviewModel),
    );
  }

  @override
  Future<void> deleteSpecialistReview(ReviewModel reviewModel) {
    return _specialistRepository.deleteSpecialistReview(
      _reviewDtoFromModel.create(reviewModel),
    );
  }
}
