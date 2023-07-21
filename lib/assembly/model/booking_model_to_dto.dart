import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';

import '../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../domain/entity/booking_data/booking_data.dart';

@Injectable(as: Factory<BookingDataDto, BookingData>)
class BookingModelToDto implements Factory<BookingDataDto, BookingData> {
  @override
  BookingDataDto create(BookingData param) => BookingDataDto(
        specialistId: param.specialistId,
        userId: param.userId,
        notes: param.notes,
        bookTime: param.bookTime,
        createdAt: param.createdAt,
      );
}