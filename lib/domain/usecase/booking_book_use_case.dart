import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class BookingBookUseCase {
  BookingBookUseCase(this._service);

  final BookingService _service;

  Future<void> call(BookingData bookingData) =>
      _service.bookSpecialist(bookingData);
}
