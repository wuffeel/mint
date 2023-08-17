import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

@injectable
class UserDataUpdateUseCase {
  UserDataUpdateUseCase(this._service);

  final UserService _service;

  Future<UserModel> call(UserModel userData) =>
      _service.updateUserData(userData);
}
