import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';
import 'package:mint/data/repository/abstract/specialist_repository.dart';

import '../../model/filter_preferences_dto/filter_preferences_dto.dart';

@Injectable(as: SpecialistRepository)
class FirebaseSpecialistRepository implements SpecialistRepository {
  final _firestoreInstance = FirebaseFirestore.instance;

  static const _orderByDate = 'createdAt';

  static const _specialistCollection = 'specialists';
  static const _favoriteCollection = 'favorites';

  CollectionReference get _specialistCollectionRef =>
      _firestoreInstance.collection(_specialistCollection);

  CollectionReference get _favoriteCollectionRef =>
      _firestoreInstance.collection(_favoriteCollection);

  @override
  Future<List<SpecialistModelDto>> getSpecialistsOnline() async {
    final querySnapshot =
        await _specialistCollectionRef.where('isOnline', isEqualTo: true).get();

    return _specialistDtoListFromSnapshot(querySnapshot);
  }

  @override
  Future<List<SpecialistModelDto>> getFavoriteSpecialists(String userId) async {
    final favoriteSnapshot = await _favoriteCollectionRef
        .where('userId', isEqualTo: userId)
        .orderBy(_orderByDate)
        .get();

    final favoriteIds = favoriteSnapshot.docs
        .map((doc) => (doc.data() as Map<String, dynamic>?)?['specialistId'])
        .whereType<String>()
        .toList();

    if (favoriteIds.isEmpty) return [];

    final specialistSnapshot =
        await _specialistCollectionRef.where('id', whereIn: favoriteIds).get();

    return _specialistDtoListFromSnapshot(specialistSnapshot);
  }

  @override
  Future<void> addToFavorite(String userId, String specialistId) {
    return _favoriteCollectionRef.doc('$userId-$specialistId').set({
      'userId': userId,
      'specialistId': specialistId,
      'createdAt': DateTime.now(),
    });
  }

  @override
  Future<void> removeFromFavorite(
    String userId,
    String specialistId,
  ) {
    return _favoriteCollectionRef.doc('$userId-$specialistId').delete();
  }

  @override
  Future<List<SpecialistModelDto>> getSpecialistCatalogue(
    FilterPreferencesDto filter,
  ) async {
    if (filter.isEmpty) {
      final specialistSnapshot = await _specialistCollectionRef.get();
      return _specialistDtoListFromSnapshot(specialistSnapshot);
    }

    final queries =
        _getSpecializationsQueries(_specialistCollectionRef, filter);

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

  /// Returns specialist by given [snapshot]
  SpecialistModelDto? _specialistDtoFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) return null;
    data['id'] = snapshot.id;

    return SpecialistModelDto.fromJson(data);
  }

  /// Returns list of specialists by given [snapshot]
  List<SpecialistModelDto> _specialistDtoListFromSnapshot(
    QuerySnapshot snapshot,
  ) {
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

    final chunked = _chunkList(specializations, 10);

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
    final isLessOrMoreThan = filter.isExperienceLessOrMoreThan;

    if (isLessOrMoreThan == null ||
        (experienceFrom == null && experienceTo == null)) {
      return query;
    }

    if (experienceFrom != null) {
      updated = isLessOrMoreThan
          ? updated.where('experience', isGreaterThan: experienceFrom)
          : updated.where('experience', isGreaterThanOrEqualTo: experienceFrom);
    }
    if (experienceTo != null) {
      updated = isLessOrMoreThan
          ? updated.where('experience', isLessThan: experienceTo)
          : updated.where('experience', isLessThanOrEqualTo: experienceTo);
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
  List<List<T>> _chunkList<T>(List<T> list, int chunkSize) {
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
