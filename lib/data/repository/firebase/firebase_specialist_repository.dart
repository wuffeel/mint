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

    final query = _specialistCatalogueQuery(filter);

    if (_filterHasSeveralComparisonFields(filter)) {
      return _separateFilterQueriesMerged(query, filter);
    }

    final specialistSnapshot = await _getFilterOrderBy(query, filter).get();
    return _specialistDtoListFromSnapshot(specialistSnapshot);
  }

  SpecialistModelDto? _specialistDtoFromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) return null;
    data['id'] = snapshot.id;

    return SpecialistModelDto.fromJson(data);
  }

  List<SpecialistModelDto> _specialistDtoListFromSnapshot(
    QuerySnapshot snapshot,
  ) {
    return snapshot.docs
        .map(_specialistDtoFromSnapshot)
        .whereType<SpecialistModelDto>()
        .toList();
  }

  Query<Object?> _specialistCatalogueQuery(FilterPreferencesDto filter) {
    Query<Object?> query = _specialistCollectionRef;

    final specializations = filter.specializations;

    if (!_filterHasSeveralComparisonFields(filter)) {
      query = _getPriceFilter(query, filter);
      query = _getExperienceFilter(query, filter);
    }

    if (specializations != null) {
      query = query.where('specializations', arrayContainsAny: specializations);
    }

    return query;
  }

  Future<List<SpecialistModelDto>> _separateFilterQueriesMerged(
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

    return mergedSpecialists.toList();
  }

  /// Returns query with filter by price, without orderBy
  ///
  /// If filter's lowPrice and highPrice both null, returns [query]
  Query<Object?> _getPriceFilter(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    var localQuery = query;

    final lowPrice = filter.lowPrice;
    final highPrice = filter.highPrice;

    if (lowPrice != null) {
      localQuery = localQuery.where('price', isGreaterThanOrEqualTo: lowPrice);
    }
    if (highPrice != null) {
      localQuery = localQuery.where('price', isLessThanOrEqualTo: highPrice);
    }

    return localQuery;
  }

  /// Returns query with filter by experience, without orderBy
  ///
  /// If filter's experienceFrom and experienceTo both null, returns [query]
  Query<Object?> _getExperienceFilter(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    var localQuery = query;

    final experienceFrom = filter.experienceFrom;
    final experienceTo = filter.experienceTo;
    final isLessOrMoreThan = filter.isExperienceLessOrMoreThan;

    if (isLessOrMoreThan == null ||
        (experienceFrom == null && experienceTo == null)) {
      return query;
    }

    if (experienceFrom != null) {
      localQuery = isLessOrMoreThan
          ? localQuery.where('experience', isGreaterThan: experienceFrom)
          : localQuery.where(
              'experience',
              isGreaterThanOrEqualTo: experienceFrom,
            );
    }
    if (experienceTo != null) {
      localQuery = isLessOrMoreThan
          ? localQuery.where('experience', isLessThan: experienceTo)
          : localQuery.where('experience', isLessThanOrEqualTo: experienceTo);
    }

    return localQuery;
  }

  /// Returns either order by price or experience
  ///
  /// Use it only if confident that query do not have both filters in one query
  Query<Object?> _getFilterOrderBy(
    Query<Object?> query,
    FilterPreferencesDto filter,
  ) {
    var localQuery = query;
    if (filter.lowPrice != null || filter.highPrice != null) {
      localQuery = localQuery.orderBy('price');
    }
    if (filter.experienceFrom != null || filter.experienceTo != null) {
      localQuery = query.orderBy('experience');
    }
    return localQuery;
  }

  /// Check if filter has both filter by price and experience.
  ///
  /// If yes, it is necessary to query these filters separately, because
  /// Firestore can't have several comparison fields in one query
  bool _filterHasSeveralComparisonFields(FilterPreferencesDto filter) {
    final lowPrice = filter.lowPrice;
    final highPrice = filter.highPrice;
    final experienceFrom = filter.experienceFrom;
    final experienceTo = filter.experienceTo;
    if ((lowPrice != null || highPrice != null) &&
        (experienceFrom != null || experienceTo != null)) {
      return true;
    }
    return false;
  }
}
