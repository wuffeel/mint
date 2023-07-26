import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/booking_controller.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/upcoming_consultation_data/upcoming_consultation_data.dart';
import '../../domain/entity/user_model/user_model.dart';
import '../../domain/usecase/fetch_upcoming_consultations_use_case.dart';

part 'upcoming_consultations_event.dart';

part 'upcoming_consultations_state.dart';

@injectable
class UpcomingConsultationsBloc
    extends Bloc<UpcomingConsultationsEvent, UpcomingConsultationsState> {
  UpcomingConsultationsBloc(
    this._fetchUpcomingConsultationsUseCase,
    this._userController,
    this._bookingController,
  ) : super(UpcomingConsultationsInitial()) {
    _subscribeToUserChange();
    _subscribeToBookingChange();
    on<UpcomingConsultationsFetchRequested>(_onUpcomingFetch);
  }

  final FetchUpcomingConsultationsUseCase _fetchUpcomingConsultationsUseCase;

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
      add(UpcomingConsultationsFetchRequested());
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _bookingSubscription.cancel();
    return super.close();
  }

  Future<void> _onUpcomingFetch(
    UpcomingConsultationsFetchRequested event,
    Emitter<UpcomingConsultationsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      emit(UpcomingConsultationsFetchLoading());
      final consultations = await _fetchUpcomingConsultationsUseCase(user.id);
      final now = DateTime.now();
      final dayAfter = DateTime(now.year, now.month, now.day + 2);
      final inTwoDays =
          consultations.where((e) => e.bookTime.isBefore(dayAfter)).toList();
      emit(UpcomingConsultationsFetchSuccess(inTwoDays));
    } catch (error) {
      log('UpcomingConsultationsFetchFailure: $error');
      emit(UpcomingConsultationsFetchFailure());
    }
  }
}
