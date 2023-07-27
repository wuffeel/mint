import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

import '../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../domain/entity/booking_data/booking_data.dart';

@Injectable(as: Factory<Future<BookingData?>, BookingDataDto>)
class BookingDataFromDto
    implements Factory<Future<BookingData?>, BookingDataDto> {
  BookingDataFromDto(this._service);

  final SpecialistService _service;

  @override
  Future<BookingData?> create(BookingDataDto param) async {
    final specialist = await _service.getSpecialist(param.specialistId);
    if (specialist == null) return null;
    return BookingData(
      id: param.id,
      specialistModel: specialist,
      userId: param.userId,
      notes: param.notes,
      bookTime: param.bookTime.toLocal(),
      durationMinutes: param.durationMinutes,
    );
  }
}
