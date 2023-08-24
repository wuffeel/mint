import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/notification_service.dart';

@injectable
class GetBookingNotificationsStreamUseCase {
  GetBookingNotificationsStreamUseCase(this._service);

  final NotificationService _service;

  Stream<String> get onBookingId => _service.onBookingId;
}
