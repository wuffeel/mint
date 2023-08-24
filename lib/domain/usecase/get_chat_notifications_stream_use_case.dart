import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/notification_service.dart';

@injectable
class GetChatNotificationsStreamUseCase {
  GetChatNotificationsStreamUseCase(this._service);

  final NotificationService _service;

  Stream<String> get onChatRoomId => _service.onChatRoomId;
}
