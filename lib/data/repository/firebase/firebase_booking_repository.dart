import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';
import 'package:mint/domain/errors/booking_duplicate_exception.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

import '../../model/booking_data_dto/booking_data_dto.dart';

@Injectable(as: BookingRepository)
class FirebaseBookingRepository implements BookingRepository {
  FirebaseBookingRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  static const _bookingInfoFunction = 'fetchBookingInformation';
  static const _bookingsCollection = 'bookings';

  Future<CollectionReference<Map<String, dynamic>>> get _bookingsRef async =>
      (await _firebaseInitializer.firestore).collection(_bookingsCollection);

  @override
  Future<SpecialistWorkInfoDto> getSpecialistWorkInfo(
    String specialistId,
  ) async {
    final functions = await _firebaseInitializer.functions;

    final callable = functions.httpsCallable(_bookingInfoFunction);

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

    final bookingsCollection = await _bookingsRef;
    final booking = await bookingsCollection.add(bookingData.toJsonWithoutId());

    return bookingData.copyWith(id: booking.id);
  }

  @override
  Future<void> bookReschedule(BookingDataDto newBookingData) async {
    final firestore = await _firebaseInitializer.firestore;
    final bookingsCollection = firestore.collection(_bookingsCollection);
    return bookingsCollection
        .doc(newBookingData.id)
        .update(newBookingData.toJsonWithoutId());
  }

  @override
  Future<void> cancelBooking(String bookingId) async {
    final bookingsCollection = await _bookingsRef;
    return bookingsCollection.doc(bookingId).delete();
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
    final bookingsCollection = await _bookingsRef;

    final bookingSnap = await bookingsCollection.doc(bookingId).get();
    final bookingData = bookingSnap.data();
    if (bookingData == null) return null;

    return BookingDataDto.fromJsonWithId(bookingData, bookingSnap.id);
  }

  /// Checks for existing book entry in Firebase.
  Future<bool> _isBookExist(
    String specialistId,
    DateTime bookTime,
  ) async {
    final bookingsCollection = await _bookingsRef;

    final bookingSnapshot = await bookingsCollection
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
    final bookingsCollection = await _bookingsRef;

    final nowUtc = DateTime.now().toUtc();

    var query = isUpcoming
        ? bookingsCollection.where('endTime', isGreaterThan: nowUtc)
        : bookingsCollection.where('endTime', isLessThan: nowUtc);

    query = query
        .where('userId', isEqualTo: userId)
        .orderBy('endTime', descending: !isUpcoming);

    if (limit != null) {
      query = query.limit(limit);
    }

    if (lastBookingId != null) {
      final lastBookingDoc = await bookingsCollection.doc(lastBookingId).get();
      query = query.startAfterDocument(lastBookingDoc);
    }

    final sessionsSnapshot = await query.get();

    return sessionsSnapshot.docs.map((consultation) {
      final data = consultation.data();
      return BookingDataDto.fromJsonWithId(data, consultation.id);
    }).toList();
  }
}
