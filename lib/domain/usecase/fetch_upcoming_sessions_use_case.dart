import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class FetchUpcomingSessionsUseCase {
  FetchUpcomingSessionsUseCase(this._service);

  final BookingService _service;

  Future<List<BookingData>> call(String userId) =>
      _service.getUpcomingSessions(userId);
}
