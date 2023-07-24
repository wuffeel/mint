import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';

import '../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../domain/entity/booking_data/booking_data.dart';

@Injectable(as: Factory<BookingData, BookingDataDto>)
class BookingDataFromDto implements Factory<BookingData, BookingDataDto> {
  @override
  BookingData create(BookingDataDto param) {
    return BookingData(
      id: param.id,
      specialistId: param.specialistId,
      userId: param.userId,
      notes: param.notes,
      bookTime: param.bookTime.toLocal(),
      durationMinutes: param.durationMinutes,
    );
  }
}
