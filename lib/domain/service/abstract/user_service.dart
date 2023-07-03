import 'package:mint/domain/entity/user_model.dart';

abstract class UserService {
  Future<UserModel?> getCurrentUser();

  Future<void> logOut();
}
