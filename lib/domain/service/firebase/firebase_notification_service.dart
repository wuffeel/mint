import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/notification_repository.dart';
import 'package:mint/domain/service/abstract/notification_service.dart';

@Injectable(as: NotificationService)
class FirebaseNotificationService implements NotificationService {
  FirebaseNotificationService(this._notificationRepository);

  final NotificationRepository _notificationRepository;

  @override
  Future<void> initializeNotifications(String userId) {
    return _notificationRepository.initializeNotifications(userId);
  }
}
