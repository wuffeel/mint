import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/user_model_dto.dart';
import 'package:mint/data/repository/abstract/user_repository.dart';

@Injectable(as: UserRepository)
class FirebaseUserRepository implements UserRepository{
  FirebaseUserRepository(this._userModelFromJson);

  final Factory<UserModelDto, Map<String, dynamic>> _userModelFromJson;

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
    return _userModelFromJson.create(userData);
  }

  @override
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  Future<void> _addNewUser(User user) async {
    await _userCollectionRef.doc(user.uid).set({
      'id': user.uid,
      'phoneNumber': user.phoneNumber,
    });
  }
}
