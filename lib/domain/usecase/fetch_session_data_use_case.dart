import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class FetchSessionDataUseCase {
  FetchSessionDataUseCase(this._service);

  final BookingService _service;

  Future<BookingData?> call(String bookingId) => _service.getSession(bookingId);
}
