import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';
import 'package:mint/domain/errors/booking_duplicate_exception.dart';

import '../../model/booking_data_dto/booking_data_dto.dart';
import '../../model/session_data_dto/session_data_dto.dart';

@Injectable(as: BookingRepository)
class FirebaseBookingRepository implements BookingRepository {
  final _functionsInstance = FirebaseFunctions.instance;
  final _firestoreInstance = FirebaseFirestore.instance;

  static const _bookingInfoFunction = 'fetchBookingInformation';
  static const _bookingsCollection = 'bookings';

  CollectionReference get _bookingsCollectionRef =>
      _firestoreInstance.collection(_bookingsCollection);

  @override
  Future<SpecialistWorkInfoDto> getSpecialistWorkInfo(
    String specialistId,
  ) async {
    final callable = _functionsInstance.httpsCallable(_bookingInfoFunction);

    final result = await callable.call<Map<String, dynamic>>({
      'specialistId': specialistId,
    });

    final data = result.data;

    return SpecialistWorkInfoDto.fromJson(data);
  }

  @override
  Future<BookingDataDto> bookSpecialist(BookingDataDto bookingData) async {
    final bookExists = await _isBookExist(
      bookingData.specialistId,
      bookingData.bookTime,
    );

    if (bookExists) throw BookingDuplicateException();

    final booking = await _bookingsCollectionRef.add(
      bookingData.toJsonWithoutId(),
    );
    return bookingData.copyWith(id: booking.id);
  }

  Future<bool> _isBookExist(
    String specialistId,
    DateTime bookTime,
  ) async {
    final bookingSnapshot = await _bookingsCollectionRef
        .where('specialistId', isEqualTo: specialistId)
        .where('bookTime', isEqualTo: bookTime)
        .limit(1)
        .get();

    return bookingSnapshot.docs.isNotEmpty;
  }

  @override
  Future<List<SessionDataDto>> getUpcomingSessions(
    String userId,
  ) async {
    final nowUtc = DateTime.now().toUtc();
    final consultationsSnapshot = await _bookingsCollectionRef
        .where('userId', isEqualTo: userId)
        .where('bookTime', isGreaterThan: nowUtc)
        .orderBy('bookTime')
        .get();

    return consultationsSnapshot.docs
        .map((consultation) {
          final data = consultation.data() as Map<String, dynamic>?;
          if (data == null) return null;
          data['id'] = consultation.id;

          return SessionDataDto.fromJson(data);
        })
        .whereType<SessionDataDto>()
        .toList();
  }
}
