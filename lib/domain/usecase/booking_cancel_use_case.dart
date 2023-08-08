import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class BookingCancelUseCase {
  BookingCancelUseCase(this._service);

  final BookingService _service;

  Future<void> call(String bookingId) => _service.cancelBooking(bookingId);
}
