import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/booking_controller.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';
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
    on<UpcomingSessionsBookingCancelled>(_onCancelBooking);
  }

  final FetchUpcomingSessionsUseCase _fetchUpcomingSessionsUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  final BookingController _bookingController;

  late final StreamSubscription<UserModel?> _userSubscription;
  late final StreamSubscription<BookingData> _newBookingSubscription;
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
    _cancelBookingSubscription =
        _bookingController.cancelBooking.listen((bookingId) {
      add(UpcomingSessionsBookingCancelled(bookingId));
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _newBookingSubscription.cancel();
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
      final consultations = await _fetchUpcomingSessionsUseCase(user.id);
      final now = DateTime.now();
      final dayAfter =
          DateTime(now.year, now.month, now.day + 2, now.hour, now.minute);
      final inTwoDays =
          consultations.where((e) => e.bookTime.isBefore(dayAfter)).toList();
      emit(UpcomingSessionsFetchSuccess(inTwoDays));
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

    final updatedList = [...state.upcomingList, event.bookingData]
      ..sort((a, b) => a.bookTime.compareTo(b.bookTime));
    emit(UpcomingSessionsFetchSuccess(updatedList));
  }

  void _onCancelBooking(
    UpcomingSessionsBookingCancelled event,
    Emitter<UpcomingSessionsState> emit,
  ) {
    final state = this.state;
    if (state is! UpcomingSessionsFetchSuccess) return;

    final updatedList = state.upcomingList
      ..removeWhere((session) => session.id == event.bookingId);

    emit(UpcomingSessionsFetchSuccess(updatedList));
  }
}
