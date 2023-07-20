import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/domain/usecase/booking_info_fetch_use_case.dart';

part 'booking_event.dart';

part 'booking_state.dart';

@injectable
class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc(
    this._bookingInfoFetchUseCase,
  ) : super(BookingInitial()) {
    on<BookingInfoRequested>(_onBookingInfoRequest);
  }

  final BookingInfoFetchUseCase _bookingInfoFetchUseCase;

  Future<void> _onBookingInfoRequest(
    BookingInfoRequested event,
    Emitter<BookingState> emit,
  ) async {
    emit(BookingInfoLoading());
    try {
      final bookingInfo = await _bookingInfoFetchUseCase(event.specialistId);
      log(bookingInfo.toString());
      emit(BookingInfoFetchSuccess(bookingInfo));
    } catch (error) {
      log('BookingInfoFetchFailure: $error');
      emit(BookingInfoFetchFailure());
    }
  }
}
