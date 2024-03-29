import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../domain/entity/booking_data/booking_data.dart';

@Injectable(as: Factory<BookingDataDto, BookingData>)
class BookingDataToDto implements Factory<BookingDataDto, BookingData> {
  @override
  BookingDataDto create(BookingData param) => BookingDataDto(
        id: param.id,
        specialistId: param.specialistModel.id,
        userId: param.userId,
        notes: param.notes,
        bookTime: param.bookTime.toUtc(),
        endTime: param.endTime.toUtc(),
        durationMinutes: param.durationMinutes,
        createdAt: DateTime.now().toUtc(),
      );
}
