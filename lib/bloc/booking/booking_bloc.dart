import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/booking_controller.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/errors/booking_duplicate_exception.dart';
import 'package:mint/domain/usecase/booking_book_use_case.dart';
import 'package:mint/domain/usecase/specialist_work_info_fetch_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'booking_event.dart';

part 'booking_state.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc(
    this._userController,
    this._specialistWorkInfoFetchUseCase,
    this._bookingBookUseCase,
    this._bookingController,
  ) : super(BookingInitial()) {
    _subscribeToUserChange();
    on<BookingWorkInfoRequested>(_onWorkInfoRequest);
    on<BookingBookRequested>(_onBookRequest);
  }

  final SpecialistWorkInfoFetchUseCase _specialistWorkInfoFetchUseCase;
  final BookingBookUseCase _bookingBookUseCase;

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
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(BookingBookLoading());
      if (DateTime.now().isAfter(event.bookTime)) {
        emit(BookingBookLateFailure());
        return;
      }
      final bookingData = BookingData(
        id: '',
        specialistId: event.specialistId,
        userId: user.id,
        notes: event.notes,
        bookTime: event.bookTime,
        durationMinutes: event.durationMinutes,
      );
      final booking = await _bookingBookUseCase(bookingData);
      _bookingController.addToBookingsStream(hasChanged: true);
      emit(BookingBookSuccess(booking));
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
