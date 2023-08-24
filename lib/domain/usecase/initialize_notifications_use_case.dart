import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/notification_service.dart';

@injectable
class InitializeNotificationsUseCase {
  InitializeNotificationsUseCase(this._service);

  final NotificationService _service;

  Future<void> call(String userId) => _service.initializeNotifications(userId);
}
