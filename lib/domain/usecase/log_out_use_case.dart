import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

@injectable
class LogOutUseCase {
  LogOutUseCase(this._service);

  final UserService _service;

  Future<void> call() => _service.logOut();
}
