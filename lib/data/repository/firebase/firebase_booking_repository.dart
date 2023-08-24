import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';
import 'package:mint/domain/errors/booking_duplicate_exception.dart';

import '../../model/booking_data_dto/booking_data_dto.dart';

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
    if (bookExists) {
      throw BookingDuplicateException(
        code: 'already-booked',
        message: 'The time is already exist in bookings',
      );
    }

    final booking = await _bookingsCollectionRef.add(
      bookingData.toJsonWithoutId(),
    );

    return bookingData.copyWith(id: booking.id);
  }

  @override
  Future<void> bookReschedule(BookingDataDto newBookingData) async {
    return _bookingsCollectionRef
        .doc(newBookingData.id)
        .update(newBookingData.toJsonWithoutId());
  }

  @override
  Future<void> cancelBooking(String bookingId) {
    return _bookingsCollectionRef.doc(bookingId).delete();
  }

  @override
  Future<List<BookingDataDto>> getUpcomingSessions(String userId) async {
    return _getSessions(userId, isUpcoming: true);
  }

  @override
  Future<List<BookingDataDto>> getPreviousSessions(
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
  Future<BookingDataDto?> getSession(String bookingId) async {
    final bookingSnap = await _bookingsCollectionRef.doc(bookingId).get();
    final bookingData = bookingSnap.data() as Map<String, dynamic>?;
    if (bookingData == null) return null;

    return BookingDataDto.fromJsonWithId(bookingData, bookingSnap.id);
  }

  /// Checks for existing book entry in Firebase.
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

  /// Retrieves a list of sessions (consultations) for a given user.
  ///
  /// [isUpcoming] boolean defines which sessions list should be fetched.
  ///
  /// Will contain sessions that either:
  /// - have an 'endTime' greater than the current UTC time (upcoming sessions)
  /// - 'endTime' less than the current UTC time (previous sessions).
  ///
  Future<List<BookingDataDto>> _getSessions(
    String userId, {
    required bool isUpcoming,
    String? lastBookingId,
    int? limit,
  }) async {
    final nowUtc = DateTime.now().toUtc();

    var query = isUpcoming
        ? _bookingsCollectionRef.where('endTime', isGreaterThan: nowUtc)
        : _bookingsCollectionRef.where('endTime', isLessThan: nowUtc);

    query = query
        .where('userId', isEqualTo: userId)
        .orderBy('endTime', descending: !isUpcoming);

    if (limit != null) {
      query = query.limit(limit);
    }

    if (lastBookingId != null) {
      final lastBookingDoc =
          await _bookingsCollectionRef.doc(lastBookingId).get();
      query = query.startAfterDocument(lastBookingDoc);
    }

    final sessionsSnapshot = await query.get();

    return sessionsSnapshot.docs
        .map((consultation) {
          final data = consultation.data() as Map<String, dynamic>?;
          if (data == null) return null;
          return BookingDataDto.fromJsonWithId(data, consultation.id);
        })
        .whereType<BookingDataDto>()
        .toList();
  }
}
