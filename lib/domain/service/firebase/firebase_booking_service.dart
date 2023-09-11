import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../../data/model/booking_data_dto/booking_data_dto.dart';
import '../../../data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import '../../entity/booking_data/booking_data.dart';

@Injectable(as: BookingService)
class FirebaseBookingService implements BookingService {
  FirebaseBookingService(
    this._bookingRepository,
    this._specialistWorkInfoFromDto,
    this._bookingDataToDto,
    this._bookingDataFromDto,
  );

  final BookingRepository _bookingRepository;

  final Factory<SpecialistWorkInfo, SpecialistWorkInfoDto>
      _specialistWorkInfoFromDto;
  final Factory<BookingDataDto, BookingData> _bookingDataToDto;
  final Factory<Future<BookingData?>, BookingDataDto> _bookingDataFromDto;

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
    return bookingData.copyWith(id: booking.id);
  }

  @override
  Future<void> bookReschedule(BookingData newBookingData) async {
    return _bookingRepository.bookReschedule(
      _bookingDataToDto.create(newBookingData),
    );
  }

  @override
  Future<void> cancelBooking(String bookingId) {
    return _bookingRepository.cancelBooking(bookingId);
  }

  @override
  Future<List<BookingData>> getUpcomingSessions(String userId) async {
    return _getSessions(userId, isUpcoming: true);
  }

  @override
  Future<List<BookingData>> getPreviousSessions(
    String userId, {
    String? lastBookingId,
    int? limit,
  }) async {
    return _getSessions(
      userId,
      isUpcoming: false,
      lastBookingId: lastBookingId,
      limit: limit,
    );
  }

  @override
  Future<BookingData?> getSession(String bookingId) async {
    final sessionDto = await _bookingRepository.getSession(bookingId);
    if (sessionDto == null) return null;
    return _bookingDataFromDto.create(sessionDto);
  }

  Future<List<BookingData>> _getSessions(
    String userId, {
    required bool isUpcoming,
    String? lastBookingId,
    int? limit,
  }) async {
    final sessions = isUpcoming
        ? await _bookingRepository.getUpcomingSessions(userId)
        : await _bookingRepository.getPreviousSessions(
            userId,
            lastBookingId: lastBookingId,
            limit: limit,
          );

    final sessionList = await Future.wait(
      sessions.map(_bookingDataFromDto.create),
    );

    return sessionList.whereType<BookingData>().toList();
  }
}
