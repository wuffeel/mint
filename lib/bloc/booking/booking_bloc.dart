import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/usecase/booking_book_use_case.dart';
import 'package:mint/domain/usecase/booking_info_fetch_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'booking_event.dart';

part 'booking_state.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc(
    this._userController,
    this._bookingInfoFetchUseCase,
    this._bookingBookUseCase,
  ) : super(BookingInitial()) {
    _subscribeToUserChange();
    on<BookingInfoRequested>(_onBookingInfoRequest);
    on<BookingBookRequested>(_onBookRequest);
  }

  final BookingInfoFetchUseCase _bookingInfoFetchUseCase;
  final BookingBookUseCase _bookingBookUseCase;

  UserModel? _currentUser;
  final UserController _userController;

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

  Future<void> _onBookingInfoRequest(
    BookingInfoRequested event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingInfoLoading());
    try {
      final bookingInfo = await _bookingInfoFetchUseCase(event.specialistId);
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
      final selectedDate = event.selectedDate;
      final selectedTime = event.selectedTime;
      final bookTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute,
        selectedTime.second,
      );
      final bookingData = BookingData(
        specialistId: event.specialistId,
        userId: user.id,
        notes: event.notes,
        bookTime: bookTime,
        durationMinutes: event.durationMinutes,
        createdAt: DateTime.now(),
      );
      await _bookingBookUseCase(bookingData);
      emit(BookingBookSuccess());
    } catch (error) {
      log('BookingBookFailure: $error');
      emit(BookingBookFailure());
    }
  }
}
