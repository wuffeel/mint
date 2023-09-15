import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class UserDataUpdateUseCase {
  UserDataUpdateUseCase(this._service);

  final UserService _service;

  Future<PatientUser> call(PatientUser userData, {FileData? photoData}) async {
    final user = await _service.updateUserData(userData, photoData: photoData);
    if (user is PatientUser) return user;
    throw ArgumentError(
      '[UserDataUpdateUseCase]: Wrong user type: ${user.runtimeType}',
    );
  }
}
