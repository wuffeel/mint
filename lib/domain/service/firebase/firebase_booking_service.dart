import 'package:injectable/injectable.dart';
import 'package:mint/data/model/session_data_dto/session_data_dto.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../../data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import '../../entity/booking_data/booking_data.dart';
import '../../entity/session_data/session_data.dart';

@Injectable(as: BookingService)
class FirebaseBookingService implements BookingService {
  FirebaseBookingService(
    this._bookingRepository,
    this._specialistWorkInfoFromDto,
    this._bookingDataToDto,
    this._bookingDataFromDto,
    this._upcomingSessionDataFromDto,
  );

  final BookingRepository _bookingRepository;

  final Factory<SpecialistWorkInfo, SpecialistWorkInfoDto>
      _specialistWorkInfoFromDto;
  final Factory<BookingDataDto, BookingData> _bookingDataToDto;
  final Factory<BookingData, BookingDataDto> _bookingDataFromDto;
  final Factory<Future<SessionData?>, SessionDataDto>
      _upcomingSessionDataFromDto;

  @override
  Future<SpecialistWorkInfo> getSpecialistWorkInfo(String specialistId) async {
    final workInfoDto = await _bookingRepository.getSpecialistWorkInfo(
      specialistId,
    );
    return _specialistWorkInfoFromDto.create(workInfoDto);
  }

  @override
  Future<BookingData> bookSpecialist(BookingData bookingData) async {
    final booking = await _bookingRepository.bookSpecialist(
      _bookingDataToDto.create(bookingData),
    );
    return _bookingDataFromDto.create(booking);
  }

  @override
  Future<List<SessionData>> getUpcomingSessions(String userId) async {
    final consultations = await _bookingRepository.getUpcomingSessions(
      userId,
    );

    final consultationList = consultations.map((e) async {
      final data = await _upcomingSessionDataFromDto.create(e);
      if (data == null) return null;
      return _upcomingSessionDataFromDto.create(e);
    });

    final list = await Future.wait(consultationList);
    return list.whereType<SessionData>().toList();
  }
}
