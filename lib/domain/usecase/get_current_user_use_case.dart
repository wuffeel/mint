import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/user_model.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

@injectable
class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this._service);

  final UserService _service;

  Future<UserModel?> call() => _service.getCurrentUser();
}
