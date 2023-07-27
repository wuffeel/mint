import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/booking_controller.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/session_data/session_data.dart';
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
  }

  final FetchUpcomingSessionsUseCase _fetchUpcomingSessionsUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  final BookingController _bookingController;

  late final StreamSubscription<UserModel?> _userSubscription;
  late final StreamSubscription<bool> _bookingSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  void _subscribeToBookingChange() {
    _bookingSubscription = _bookingController.bookings.listen((_) {
      add(UpcomingSessionsFetchRequested());
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _bookingSubscription.cancel();
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
      final dayAfter = DateTime(now.year, now.month, now.day + 2);
      final inTwoDays =
          consultations.where((e) => e.bookTime.isBefore(dayAfter)).toList();
      emit(UpcomingSessionsFetchSuccess(inTwoDays));
    } catch (error) {
      log('UpcomingSessionsFetchFailure: $error');
      emit(UpcomingSessionsFetchFailure());
    }
  }
}
