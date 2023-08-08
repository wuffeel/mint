import 'package:mint/data/model/user_model_dto/user_model_dto.dart';

abstract class UserRepository {
  Future<UserModelDto?> getCurrentUser();

  Future<void> changePinCode(String userUid, String? pinCode);

  Future<void> logOut();

  Future<UserModelDto?> getUserData(String userId);
}
