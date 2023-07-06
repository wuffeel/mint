import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto.dart';
import 'package:mint/data/repository/abstract/specialist_repository.dart';

@Injectable(as: SpecialistRepository)
class FirebaseSpecialistRepository implements SpecialistRepository {
  FirebaseSpecialistRepository(this._specialistFromJson);

  final Factory<SpecialistModelDto, Map<String, dynamic>> _specialistFromJson;

  final _firestoreInstance = FirebaseFirestore.instance;

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

    return querySnapshot.docs
        .map((doc) {
          final data = doc.data() as Map<String, dynamic>?;
          if (data == null) return null;
          data['id'] = doc.id;

          return _specialistFromJson.create(data);
        })
        .whereType<SpecialistModelDto>()
        .toList();
  }

  @override
  Future<List<SpecialistModelDto>> getFavoriteSpecialists(String userId) async {
    final favoriteSnapshot =
        await _favoriteCollectionRef.where('userId', isEqualTo: userId).get();

    final favoriteIds = favoriteSnapshot.docs
        .map((doc) => (doc.data() as Map<String, dynamic>?)?['specialistId'])
        .whereType<String>()
        .toList();

    if (favoriteIds.isEmpty) return [];

    final specialistSnapshot = await _specialistCollectionRef
        .where('id', whereIn: favoriteIds)
        .get();

    return specialistSnapshot.docs
        .map((doc) {
          final data = doc.data() as Map<String, dynamic>?;
          if (data == null) return null;
          data['id'] = doc.id;

          return _specialistFromJson.create(data);
        })
        .whereType<SpecialistModelDto>()
        .toList();
  }

  @override
  Future<void> addToFavorite(String userId, String specialistId) {
    return _favoriteCollectionRef.doc('$userId-$specialistId').set({
      'userId': userId,
      'specialistId': specialistId,
    });
  }

  @override
  Future<void> removeFromFavorite(
    String userId,
    String specialistId,
  ) {
    return _favoriteCollectionRef.doc('$userId-$specialistId').delete();
  }
}
