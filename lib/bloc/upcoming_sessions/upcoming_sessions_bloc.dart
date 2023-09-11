import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/booking_controller.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint_core/mint_core.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/usecase/fetch_upcoming_sessions_use_case.dart';

part 'upcoming_sessions_event.dart';

part 'upcoming_sessions_state.dart';

@injectable
class UpcomingSessionsBloc
    extends Bloc<UpcomingSessionsEvent, UpcomingSessionsState> {
  UpcomingSessionsBloc(
    this._fetchUpcomingSessionsUseCase,
    this._userController,
    this._bookingController,
  ) : super(UpcomingSessionsInitial()) {
    _subscribeToUserChange();
    _subscribeToBookingChange();
    on<UpcomingSessionsFetchRequested>(_onUpcomingFetch);
    on<UpcomingSessionsBookingAdded>(_onNewBooking);
    on<UpcomingSessionsBookingRescheduled>(_onRescheduleBooking);
    on<UpcomingSessionsBookingCancelled>(_onCancelBooking);
  }

  final FetchUpcomingSessionsUseCase _fetchUpcomingSessionsUseCase;

  PatientUser? _currentUser;
  final UserController _userController;
  final BookingController _bookingController;

  late final StreamSubscription<PatientUser?> _userSubscription;
  late final StreamSubscription<BookingData> _newBookingSubscription;
  late final StreamSubscription<BookingData> _rescheduleSubscription;
  late final StreamSubscription<String> _cancelBookingSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  void _subscribeToBookingChange() {
    _newBookingSubscription =
        _bookingController.newBooking.listen((bookingData) {
      add(UpcomingSessionsBookingAdded(bookingData));
    });
    _rescheduleSubscription =
        _bookingController.rescheduleBooking.listen((newBookingData) {
      add(UpcomingSessionsBookingRescheduled(newBookingData));
    });
    _cancelBookingSubscription =
        _bookingController.cancelBooking.listen((bookingId) {
      add(UpcomingSessionsBookingCancelled(bookingId));
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _newBookingSubscription.cancel();
    await _rescheduleSubscription.cancel();
    await _cancelBookingSubscription.cancel();
    return super.close();
  }

  Future<void> _onUpcomingFetch(
    UpcomingSessionsFetchRequested event,
    Emitter<UpcomingSessionsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      emit(UpcomingSessionsFetchLoading());
      final upcomingList = await _fetchUpcomingSessionsUseCase(user.id);
      final twoDaysList = _getTwoDaysList(upcomingList);
      emit(UpcomingSessionsFetchSuccess(upcomingList, twoDaysList));
    } catch (error) {
      log('UpcomingSessionsFetchFailure: $error');
      emit(UpcomingSessionsFetchFailure());
    }
  }

  void _onNewBooking(
    UpcomingSessionsBookingAdded event,
    Emitter<UpcomingSessionsState> emit,
  ) {
    final state = this.state;
    if (state is! UpcomingSessionsFetchSuccess) return;

    final upcomingList = [...state.upcomingList, event.bookingData]
      ..sort((a, b) => a.bookTime.compareTo(b.bookTime));
    final twoDaysList = _getTwoDaysList(upcomingList);

    emit(UpcomingSessionsFetchSuccess(upcomingList, twoDaysList));
  }

  void _onRescheduleBooking(
    UpcomingSessionsBookingRescheduled event,
    Emitter<UpcomingSessionsState> emit,
  ) {
    final state = this.state;
    if (state is! UpcomingSessionsFetchSuccess) return;

    final upcomingList = state.upcomingList.map((session) {
      return session.id == event.bookingData.id ? event.bookingData : session;
    }).toList();
    final twoDaysList = _getTwoDaysList(upcomingList);
    emit(UpcomingSessionsFetchSuccess(upcomingList, twoDaysList));
  }

  void _onCancelBooking(
    UpcomingSessionsBookingCancelled event,
    Emitter<UpcomingSessionsState> emit,
  ) {
    final state = this.state;
    if (state is! UpcomingSessionsFetchSuccess) return;

    final upcomingList = state.upcomingList
      ..removeWhere((session) => session.id == event.bookingId);
    final twoDaysList = _getTwoDaysList(upcomingList);

    emit(UpcomingSessionsFetchSuccess(upcomingList, twoDaysList));
  }

  /// Returns [upcomingList] where bookTime is within the next two days
  List<BookingData> _getTwoDaysList(List<BookingData> upcomingList) {
    final now = DateTime.now();
    final twoDaysAfter = DateTime(
      now.year,
      now.month,
      now.day + 2,
      now.hour,
      now.minute,
    );
    return upcomingList
        .where((e) => e.bookTime.isBefore(twoDaysAfter))
        .toList();
  }
}
