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
  static const _usersCollection = 'users';

  Future<FirebaseFirestore> get _firestore => _firebaseInitializer.firestore;

  Future<CollectionReference<Map<String, dynamic>>>
      get _specialistCollectionRef async =>
          (await _firestore).collection(_specialistCollection);

  Future<CollectionReference<Map<String, dynamic>>>
      get _reviewCollectionRef async =>
          (await _firestore).collection(_reviewCollection);

  Future<CollectionReference<Map<String, dynamic>>>
      get _usersCollectionRef async =>
          (await _firestore).collection(_usersCollection);

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
  Future<List<String>> getFavoriteSpecialistsIds(String userId) async {
    final usersCollection = await _usersCollectionRef;
    final favoriteIdsSnap = await usersCollection
        .doc(userId)
        .collection(_favoriteCollection)
        .orderBy('createdAt', descending: true)
        .get();
    return favoriteIdsSnap.docs.map((e) => e.id).toList();
  }

  @override
  Future<List<SpecialistModelDto>> getFavoriteSpecialists(
    List<String> favoriteIds,
  ) async {
    final specialistCollection = await _specialistCollectionRef;
    final chunkedIds = _chunkList(favoriteIds);

    final querySnapshots = chunkedIds.map(
      (chunk) => specialistCollection
          .where(FieldPath.documentId, whereIn: chunk)
          .get(),
    );

    final results = await Future.wait(querySnapshots);

    final flattenedResults = results
        .expand(
          (snap) => snap.docs.map(
            (doc) => SpecialistModelDto.fromJsonWithId(doc.data(), doc.id),
          ),
        )
        .toList();

    return _orderedFavoriteSpecialists(favoriteIds, flattenedResults);
  }

  @override
  Future<void> addToFavorite(String userId, String specialistId) async {
    return (await _usersCollectionRef)
        .doc(userId)
        .collection(_favoriteCollection)
        .doc(specialistId)
        .set({'createdAt': FieldValue.serverTimestamp()});
  }

  @override
  Future<void> removeFromFavorite(String userId, String specialistId) async {
    return (await _usersCollectionRef)
        .doc(userId)
        .collection(_favoriteCollection)
        .doc(specialistId)
        .delete();
  }

  @override
  Future<List<SpecialistModelDto>> getSpecialistCatalogue(
    FilterPreferencesDto filter, {
    String? lastSpecialistId,
    int? limit,
  }) async {
    final specialistCollection = await _specialistCollectionRef;
    Query<Map<String, dynamic>> query = specialistCollection;

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
  SpecialistModelDto? _specialistDtoFromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    if (data == null) return null;
    return SpecialistModelDto.fromJsonWithId(data, snapshot.id);
  }

  /// Returns list of specialists by given [snapshot]
  List<SpecialistModelDto> _specialistDtoListFromSnapshot(
    QuerySnapshot<Map<String, dynamic>> snapshot,
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
    Query<Map<String, dynamic>> query,
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
    Query<Map<String, dynamic>> query,
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
  List<Query<Map<String, dynamic>>> _getSpecializationsQueries(
    Query<Map<String, dynamic>> query,
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
  Query<Map<String, dynamic>> _getPriceFilter(
    Query<Map<String, dynamic>> query,
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
  Query<Map<String, dynamic>> _getExperienceFilter(
    Query<Map<String, dynamic>> query,
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
  Query<Map<String, dynamic>> _getFilterOrderBy(
    Query<Map<String, dynamic>> query,
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
    assert(
      chunkSize > 0 && chunkSize <= 10,
      '[chunkSize can not be set more than 10 due to Firestore limit]',
    );

    final chunked = <List<T>>[];
    var currentIndex = 0;

    while (currentIndex < list.length) {
      final endIndex = currentIndex + chunkSize;
      chunked.add(list.sublist(currentIndex, endIndex.clamp(0, list.length)));
      currentIndex = endIndex;
    }

    return chunked;
  }

  /// Sorts [unorderedFavorites] in the same order as [favoriteIds].
  List<SpecialistModelDto> _orderedFavoriteSpecialists(
    List<String> favoriteIds,
    List<SpecialistModelDto> unorderedFavorites,
  ) {
    final resultById = <String, SpecialistModelDto>{};
    for (final result in unorderedFavorites) {
      resultById[result.id] = result;
    }

    return favoriteIds
        .map((id) => resultById[id])
        .whereType<SpecialistModelDto>()
        .toList();
  }
}
