import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/user_model_dto/user_model_dto.dart';
import 'package:mint/data/repository/abstract/user_repository.dart';

import '../../../assembly/factory.dart';

@Injectable(as: UserRepository)
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository(this._modifiedUserDtoToMap);

  final Factory<Map<String, dynamic>, UserModelDto> _modifiedUserDtoToMap;

  static const _userCollection = 'users';

  final _firebaseAuth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  CollectionReference get _userCollectionRef {
    return _firestore.collection(_userCollection);
  }

  @override
  Future<UserModelDto?> getCurrentUser() async {
    final user = _firebaseAuth.currentUser;

    if (user == null) return null;

    final userDoc = await _userCollectionRef.doc(user.uid).get();
    final userData = userDoc.data() as Map<String, dynamic>?;

    if (userData == null) {
      return UserModelDto(id: user.uid, phoneNumber: user.phoneNumber);
    }
    return UserModelDto.fromJsonWithId(userData, user.uid);
  }

  @override
  Future<void> changePinCode(String userUid, String? pinCode) async {
    return _userCollectionRef.doc(userUid).update({'pinCode': pinCode});
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<UserModelDto?> getUserData(String userId) async {
    final userSnapshot = await _userCollectionRef.doc(userId).get();
    final user = userSnapshot.data() as Map<String, dynamic>?;
    if (user == null) return null;
    return UserModelDto.fromJsonWithId(user, userSnapshot.id);
  }

  @override
  Future<void> updateUserData(UserModelDto userDataDto) {
    final userDataMap = _modifiedUserDtoToMap.create(userDataDto);
    return _userCollectionRef.doc(userDataDto.id).update(userDataMap);
  }
}
