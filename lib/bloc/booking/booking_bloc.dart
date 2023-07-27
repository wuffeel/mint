import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/booking_controller.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/errors/booking_duplicate_exception.dart';
import 'package:mint/domain/usecase/booking_book_use_case.dart';
import 'package:mint/domain/usecase/booking_cancel_use_case.dart';
import 'package:mint/domain/usecase/booking_reschedule_use_case.dart';
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'booking_event.dart';

part 'booking_state.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc(
    this._specialistWorkInfoFetchUseCase,
    this._bookingBookUseCase,
    this._bookingRescheduleUseCase,
    this._bookingCancelUseCase,
    this._userController,
    this._bookingController,
  ) : super(BookingInitial()) {
    _subscribeToUserChange();
    on<BookingWorkInfoRequested>(_onWorkInfoRequest);
    on<BookingBookRequested>(_onBookRequest);
    on<BookingRescheduleRequested>(_onBookReschedule);
    on<BookingCancelRequested>(_onBookingCancel);
  }

  final SpecialistWorkInfoFetchUseCase _specialistWorkInfoFetchUseCase;
  final BookingBookUseCase _bookingBookUseCase;
  final BookingRescheduleUseCase _bookingRescheduleUseCase;
  final BookingCancelUseCase _bookingCancelUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  final BookingController _bookingController;

  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onWorkInfoRequest(
    BookingWorkInfoRequested event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingInfoLoading());
    try {
      final bookingInfo = await _specialistWorkInfoFetchUseCase(
        event.specialistId,
      );
      emit(BookingInfoFetchSuccess(bookingInfo));
    } catch (error) {
      log('BookingInfoFetchFailure: $error');
      emit(BookingInfoFetchFailure());
    }
  }

  Future<void> _onBookRequest(
    BookingBookRequested event,
    Emitter<BookingState> emit,
  ) async {
    await _handleBooking(
      event.specialistModel,
      event.bookTime,
      event.notes,
      event.durationMinutes,
      emit,
    );
  }

  Future<void> _onBookReschedule(
    BookingRescheduleRequested event,
    Emitter<BookingState> emit,
  ) async {
    await _handleBooking(
      event.specialistModel,
      event.bookTime,
      event.notes,
      event.durationMinutes,
      emit,
      previousBookingData: event.previousBookingData,
    );
  }

  Future<void> _onBookingCancel(
    BookingCancelRequested event,
    Emitter<BookingState> emit,
  ) async {
    try {
      await _bookingCancelUseCase(event.bookingId);
      _bookingController.addToBookingsStream(hasChanged: true);
      emit(BookingCancelSuccess());
    } catch (error) {
      log('BookingCancelFailure: $error');
      emit(BookingCancelFailure());
    }
  }

  /// Performs the booking or rescheduling process based on the provided
  /// [event].
  ///
  /// Parameters:
  /// - [event]: The booking event containing details for the booking or
  /// rescheduling request.
  /// - [previousBookingData]: (Optional) Previous booking data for reschedule.
  ///
  /// Successful states:
  /// - [BookingRescheduleSuccess] On successful reschedule
  /// - [BookingBookSuccess] On successful book
  ///
  /// Failure states:
  /// - [BookingBookLateFailure] If the booking time in [event] has
  /// already passed.
  /// - [BookingDuplicateException] If a booking with the same specialist
  /// and book time already exists.
  /// - [BookingBookFailure] If any other error occurs during the booking or
  /// rescheduling process.
  Future<void> _handleBooking(
    SpecialistModel specialistModel,
    DateTime bookTime,
    String notes,
    int durationMinutes,
    Emitter<BookingState> emit, {
    BookingData? previousBookingData,
  }) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(BookingBookLoading());
      if (DateTime.now().isAfter(bookTime)) {
        emit(BookingBookLateFailure());
        return;
      }
      final bookingData = BookingData(
        id: '',
        specialistModel: specialistModel,
        userId: user.id,
        notes: notes,
        bookTime: bookTime,
        durationMinutes: durationMinutes,
      );
      final booking = previousBookingData != null
          ? await _bookingRescheduleUseCase(previousBookingData, bookingData)
          : await _bookingBookUseCase(bookingData);

      // Updating bookings stream here to get actual upcoming sessions info
      _bookingController.addToBookingsStream(hasChanged: true);

      previousBookingData != null
          ? emit(BookingRescheduleSuccess())
          : emit(BookingBookSuccess(booking));
    } catch (error) {
      log('BookingBookFailure: $error');
      if (error is BookingDuplicateException) {
        emit(BookingBookDuplicateFailure());
      } else {
        emit(BookingBookFailure());
      }
    }
  }
}
