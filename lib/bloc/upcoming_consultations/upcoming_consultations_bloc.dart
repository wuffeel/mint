import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

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
  ) : super(UpcomingConsultationsInitial()) {
    _subscribeToUserChange();
    on<UpcomingConsultationsFetchRequested>(_onUpcomingFetch);
  }

  final FetchUpcomingConsultationsUseCase _fetchUpcomingConsultationsUseCase;

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

  Future<void> _onUpcomingFetch(
    UpcomingConsultationsFetchRequested event,
    Emitter<UpcomingConsultationsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      emit(UpcomingConsultationsFetchLoading());
      final consultations = await _fetchUpcomingConsultationsUseCase(user.id);
      emit(UpcomingConsultationsFetchSuccess(consultations));
    } catch (error) {
      log('UpcomingConsultationsFetchFailure: $error');
      emit(UpcomingConsultationsFetchFailure());
    }
  }
}
