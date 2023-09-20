import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/specialist_repository.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../model/filter_preferences_dto/filter_preferences_dto.dart';
import '../../model/review_model_dto/review_model_dto.dart';

@Injectable(as: SpecialistRepository)
class FirebaseSpecialistRepository implements SpecialistRepository {
  FirebaseSpecialistRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  static const _orderByDate = 'createdAt';

  static const _specialistCollection = 'specialists';
  static const _favoriteCollection = 'favorites';
  static const _reviewCollection = 'reviews';

  Future<FirebaseFirestore> get _firestore => _firebaseInitializer.firestore;

  Future<CollectionReference<Map<String, dynamic>>>
      get _specialistCollectionRef async =>
          (await _firestore).collection(_specialistCollection);

  Future<CollectionReference<Map<String, dynamic>>>
      get _favoriteCollectionRef async =>
          (await _firestore).collection(_favoriteCollection);

  Future<CollectionReference<Map<String, dynamic>>>
      get _reviewCollectionRef async =>
          (await _firestore).collection(_reviewCollection);

  @override
  Future<SpecialistModelDto?> getSpecialist(String specialistId) async {
    final specialistCollection = await _specialistCollectionRef;
    final specialist = await specialistCollection.doc(specialistId).get();
    return _specialistDtoFromSnapshot(specialist);
  }

  @override
  Future<List<SpecialistModelDto>> getSpecialistsOnline({
    String? lastSpecialistId,
    int? limit,
  }) async {
    final specialistCollection = await _specialistCollectionRef;
    var query = specialistCollection.where('isOnline', isEqualTo: true);

    if (lastSpecialistId != null) {
      final lastDoc = await specialistCollection.doc(lastSpecialistId).get();
      query = query.startAfterDocument(lastDoc);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    return _specialistDtoListFromSnapshot(await query.get());
  }

  @override
  Future<List<SpecialistModelDto>> getFavoriteSpecialists(
    String userId, {
    String? lastSpecialistId,
    int? limit,
  }) async {
    final favoriteCollection = await _favoriteCollectionRef;
    final specialistCollection = await _specialistCollectionRef;

    var query = favoriteCollection
        .where('userId', isEqualTo: userId)
        .orderBy(_orderByDate);

    if (lastSpecialistId != null) {
      final lastSpecSnap = await favoriteCollection
          .where('specialistId', isEqualTo: lastSpecialistId)
          .get();
      if (lastSpecSnap.docs.isNotEmpty && lastSpecSnap.docs.length == 1) {
        query = query.startAfterDocument(lastSpecSnap.docs.first);
      }
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    final favoriteSnapshot = await query.get();

    final favoriteIds = favoriteSnapshot.docs
        .map((doc) => doc.data()['specialistId'])
        .whereType<String>()
        .toList();

    if (favoriteIds.isEmpty) return [];

    final specialistSnapshot =
        await specialistCollection.where('id', whereIn: favoriteIds).get();

    return _specialistDtoListFromSnapshot(specialistSnapshot);
  }

  @override
  Future<void> addToFavorite(String userId, String specialistId) async {
    return (await _favoriteCollectionRef).doc('$userId-$specialistId').set({
      'userId': userId,
      'specialistId': specialistId,
      'createdAt': DateTime.now(),
    });
  }

  @override
  Future<void> removeFromFavorite(
    String userId,
    String specialistId,
  ) async {
    return (await _favoriteCollectionRef).doc('$userId-$specialistId').delete();
  }

  @override
  Future<List<SpecialistModelDto>> getSpecialistCatalogue(
    FilterPreferencesDto filter, {
    String? lastSpecialistId,
    int? limit,
  }) async {
    final specialistCollection = await _specialistCollectionRef;
    Query<Object?> query = specialistCollection;

    if (lastSpecialistId != null) {
      final lastDoc = await specialistCollection.doc(lastSpecialistId).get();
      query = query.startAfterDocument(lastDoc);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (filter.isEmpty) {
      final specialistSnapshot = await query.get();
      return _specialistDtoListFromSnapshot(specialistSnapshot);
    }

    final queries = _getSpecializationsQueries(query, filter);

    final queryResults = <List<SpecialistModelDto>>[];

    if (_filterHasSeveralComparisonFields(filter)) {
      queryResults.addAll(
        await Future.wait(
          queries.map((query) => _separateFilterResultsMerged(query, filter)),
        ),
      );
    } else {
      queryResults.addAll(
        await Future.wait(
          queries.map((query) => _appliedFiltersResult(query, filter)),
        ),
      );
    }

    return queries.length > 1
        ? queryResults.expand((result) => result).toSet().toList()
        : queryResults.first;
  }

  @override
  Future<List<ReviewModelDto>> getSpecialistReviews(String specialistId) async {
    final reviewCollection = await _reviewCollectionRef;
    final reviewsSnapshot = await reviewCollection
        .where('specialistId', isEqualTo: specialistId)
        .orderBy(_orderByDate, descending: true)
        .get();

    return reviewsSnapshot.docs.map((review) {
      final data = review.data();
      return ReviewModelDto.fromJsonWithId(data, review.id);
    }).toList();
  }

  @override
  Future<ReviewModelDto> addSpecialistReview(
    ReviewModelDto reviewModelDto,
  ) async {
    final reviewCollection = await _reviewCollectionRef;
    final resultReview = await reviewCollection.add(
      reviewModelDto.toJsonWithoutId(),
    );
    return reviewModelDto.copyWith(id: resultReview.id);
  }

  @override
  Future<void> updateSpecialistReview(ReviewModelDto reviewModelDto) async {
    return (await _reviewCollectionRef)
        .doc(reviewModelDto.id)
        .set(reviewModelDto.toJsonWithoutId());
  }

  @override
  Future<void> deleteSpecialistReview(ReviewModelDto reviewModelDto) async {
    return (await _reviewCollectionRef).doc(reviewModelDto.id).delete();
  }

  /// Returns specialist by given [snapshot]
  SpecialistModelDto? _specialistDtoFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) return null;
    return SpecialistModelDto.fromJsonWithId(data, snapshot.id);
  }

  /// Returns list of specialists by given [snapshot]
  List<SpecialistModelDto> _specialistDtoListFromSnapshot(
    QuerySnapshot snapshot,
  ) {
    if (snapshot.docs.isEmpty) return [];
    return snapshot.docs
        .map(_specialistDtoFromSnapshot)
        .whereType<SpecialistModelDto>()
        .toList();
  }

  /// Used to fetch specialists catalogue with either price or experience
  /// filter combined with specializations provided in [query]
  Future<List<SpecialistModelDto>> _appliedFiltersResult(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) async {
    var filteredQuery = query;
    filteredQuery = _getPriceFilter(filteredQuery, filter);
    filteredQuery = _getExperienceFilter(filteredQuery, filter);
    filteredQuery = _getFilterOrderBy(filteredQuery, filter);
    final specialistSnapshot = await filteredQuery.get();
    return _specialistDtoListFromSnapshot(specialistSnapshot);
  }

  /// Returns separately proceeded price and experience queries results
  /// with specializations provided in [query] merged
  Future<List<SpecialistModelDto>> _separateFilterResultsMerged(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) async {
    final priceFilter = _getPriceFilter(query, filter).orderBy('price');
    final specialistsByPriceSnap = await priceFilter.get();
    final specialistsByPrice =
        _specialistDtoListFromSnapshot(specialistsByPriceSnap);

    final experienceFilter =
        _getExperienceFilter(query, filter).orderBy('experience');
    final specialistsByExperienceSnap = await experienceFilter.get();
    final specialistsByExperience =
        _specialistDtoListFromSnapshot(specialistsByExperienceSnap);

    final mergedSpecialists = specialistsByPrice
        .toSet()
        .intersection(specialistsByExperience.toSet())
        .toList();

    return mergedSpecialists;
  }

  /// Returns a list of specialization queries, chunked by 10 because of
  /// Firestore array query limitation
  ///
  /// If filter's specializations null or empty, returns list only with [query]
  List<Query<Object?>> _getSpecializationsQueries(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    final specializations = filter.specializations;
    if (specializations == null || specializations.isEmpty) {
      return [query];
    }

    final chunked = _chunkList(specializations);

    return chunked.map((element) {
      return query.where('specializations', arrayContainsAny: element);
    }).toList();
  }

  /// Returns query with filter by price, without orderBy
  ///
  /// If filter's lowPrice and highPrice both null, returns [query]
  Query<Object?> _getPriceFilter(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    var updated = query;

    final lowPrice = filter.lowPrice;
    final highPrice = filter.highPrice;

    if (lowPrice != null) {
      updated = updated.where('price', isGreaterThanOrEqualTo: lowPrice);
    }
    if (highPrice != null) {
      updated = updated.where('price', isLessThanOrEqualTo: highPrice);
    }

    return updated;
  }

  /// Returns query with filter by experience, without orderBy
  ///
  /// If filter's experienceFrom and experienceTo both null, returns [query]
  Query<Object?> _getExperienceFilter(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    var updated = query;

    final experienceFrom = filter.experienceFrom;
    final experienceTo = filter.experienceTo;

    if (experienceFrom == null && experienceTo == null) {
      return query;
    }

    if (experienceFrom != null) {
      updated = updated.where('experience', isGreaterThan: experienceFrom);
    }
    if (experienceTo != null) {
      updated = updated.where('experience', isLessThan: experienceTo);
    }

    return updated;
  }

  /// Returns either order by price or experience
  ///
  /// Use it only if confident that query do not have both filters in one query
  Query<Object?> _getFilterOrderBy(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    if (filter.lowPrice != null || filter.highPrice != null) {
      return query.orderBy('price');
    }
    if (filter.experienceFrom != null || filter.experienceTo != null) {
      return query.orderBy('experience');
    }
    return query;
  }

  /// Check if filter has both filter by price and experience.
  ///
  /// If yes, it is necessary to query these filters separately, because
  /// we can't have several comparison fields in one query based on Firestore
  /// limitation
  bool _filterHasSeveralComparisonFields(FilterPreferencesDto filter) {
    final lowPrice = filter.lowPrice;
    final highPrice = filter.highPrice;
    final experienceFrom = filter.experienceFrom;
    final experienceTo = filter.experienceTo;
    return (lowPrice != null || highPrice != null) &&
        (experienceFrom != null || experienceTo != null);
  }

  /// Divides [list] into sub-lists, each of length equal to [chunkSize]
  ///
  /// By default, [chunkSize] is set to 10, which aligns with Firestore limit
  /// for most queries.
  List<List<T>> _chunkList<T>(List<T> list, {int chunkSize = 10}) {
    final chunked = <List<T>>[];
    var currentIndex = 0;

    while (currentIndex < list.length) {
      final endIndex = currentIndex + chunkSize;
      chunked.add(list.sublist(currentIndex, endIndex.clamp(0, list.length)));
      currentIndex = endIndex;
    }

    return chunked;
  }
}
