import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class GetCurrentUserUseCase {
  GetCurrentUserUseCase(this._service);

  final UserService _service;

  Future<PatientUser?> call() async {
    final user = await _service.getCurrentUser();
    if (user is PatientUser) return user;
    return null;
  }
}
