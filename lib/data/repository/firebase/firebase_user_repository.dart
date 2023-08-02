import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/user_model_dto/user_model_dto.dart';
import 'package:mint/data/repository/abstract/user_repository.dart';

@Injectable(as: UserRepository)
class FirebaseUserRepository implements UserRepository {
  FirebaseUserRepository();

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
      await _addNewUser(user);
      return UserModelDto(id: user.uid, phoneNumber: user.phoneNumber);
    }
    userData['id'] = user.uid;
    return UserModelDto.fromJson(userData);
  }

  @override
  Future<void> changePinCode(String userUid, String? pinCode) async {
    return _userCollectionRef.doc(userUid).update({'pinCode': pinCode});
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> _addNewUser(User user) async {
    await _userCollectionRef.doc(user.uid).set({
      'phoneNumber': user.phoneNumber,
    });
  }

  @override
  Future<UserModelDto?> getUserData(String userId) async {
    final userSnapshot = await _userCollectionRef.doc(userId).get();
    final user = userSnapshot.data() as Map<String, dynamic>?;
    if (user == null) return null;
    return UserModelDto.fromJson(user);
  }
}
