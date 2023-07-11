import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

@injectable
class PinCodeChangeUseCase {
  PinCodeChangeUseCase(this._service);

  final UserService _service;

  Future<void> call(
    String userUid,
    String? pinCode,
  ) =>
      _service.changePinCode(
        userUid,
        pinCode,
      );
}
