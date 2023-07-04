import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/user_model_dto.dart';
import 'package:mint/data/repository/abstract/user_repository.dart';
import 'package:mint/domain/entity/user_model.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

@Injectable(as: UserService)
class FirebaseUserService implements UserService {
  FirebaseUserService(this._userRepository, this._userModelFromDto);

  final Factory<UserModel, UserModelDto> _userModelFromDto;

  final UserRepository _userRepository;

  @override
  Future<UserModel?> getCurrentUser() async {
    final user = await _userRepository.getCurrentUser();
    if (user == null) return null;
    return _userModelFromDto.create(user);
  }

  @override
  Future<void> changePinCode(String userUid, String? pinCode) {
    return _userRepository.changePinCode(userUid, pinCode);
  }

  @override
  Future<void> logOut() async {
    await _userRepository.logOut();
  }
}
