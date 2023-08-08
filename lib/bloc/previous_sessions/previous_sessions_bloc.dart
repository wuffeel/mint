import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/booking_data/booking_data.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'previous_sessions_event.dart';

part 'previous_sessions_state.dart';

@injectable
class PreviousSessionsBloc
    extends Bloc<PreviousSessionsEvent, PreviousSessionsState> {
  PreviousSessionsBloc(
    this._fetchPreviousSessionsUseCase,
    this._userController,
  ) : super(PreviousSessionsInitial()) {
    _subscribeToUserChange();
    on<PreviousSessionsFetchRequested>(_onPreviousFetch);
  }

  final FetchPreviousSessionsUseCase _fetchPreviousSessionsUseCase;

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

  Future<void> _onPreviousFetch(
    PreviousSessionsFetchRequested event,
    Emitter<PreviousSessionsState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(PreviousSessionsFetchLoading());
      final previousSessions = await _fetchPreviousSessionsUseCase(user.id);
      emit(PreviousSessionsFetchSuccess(previousSessions));
    } catch (error) {
      log('PreviousSessionsFetchFailure: $error');
      emit(PreviousSessionsFetchFailure());
    }
  }
}
