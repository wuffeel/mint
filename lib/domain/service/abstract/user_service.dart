import 'package:mint/domain/entity/user_model/user_model.dart';

abstract class UserService {
  Future<UserModel?> getCurrentUser();

  Future<void> changePinCode(String userUid, String? pinCode);

  Future<void> logOut();

  Future<UserModel?> getUserData(String userId);

  Future<UserModel> updateUserData(UserModel userData);
}
