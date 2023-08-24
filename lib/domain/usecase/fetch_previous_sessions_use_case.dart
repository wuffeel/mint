import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class FetchPreviousSessionsUseCase {
  FetchPreviousSessionsUseCase(this._service);

  final BookingService _service;

  Future<List<BookingData>> call(
    String userId, {
    String? lastBookingId,
    int? limit,
  }) =>
      _service.getPreviousSessions(
        userId,
        lastBookingId: lastBookingId,
        limit: limit,
      );
}
