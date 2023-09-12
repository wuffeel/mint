import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/fetch_previous_sessions_use_case.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

import '../../domain/entity/booking_data/booking_data.dart';

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
    on<PreviousSessionsFetchRequested>(
      _onPreviousFetch,
      transformer: droppable(),
    );
    on<PreviousSessionsRefreshRequested>(
      _onPreviousRefresh,
      transformer: droppable(),
    );
  }

  final FetchPreviousSessionsUseCase _fetchPreviousSessionsUseCase;

  PatientUser? _currentUser;
  final UserController<PatientUser?> _userController;

  late final StreamSubscription<PatientUser?> _userSubscription;

  /// Pagination end cursor
  String? _lastVisibleBookingId;

  /// Number of sessions to fetch
  static const _paginationLimit = 12;

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
    final state = this.state;
    final user = _currentUser;
    if (user == null ||
        state is! PreviousSessionsInitial ||
        state.hasReachedEnd) return;
    try {
      emit(
        PreviousSessionsFetchLoading(
          previousList: state.previousList,
          hasReachedEnd: state.hasReachedEnd,
        ),
      );
      final previousSessions = await _fetchPreviousSessionsUseCase(
        user.id,
        lastBookingId: _lastVisibleBookingId,
        limit: _paginationLimit,
      );
      emit(
        PreviousSessionsFetchSuccess(
          previousList: [...state.previousList, ...previousSessions],
          hasReachedEnd: previousSessions.length < _paginationLimit,
        ),
      );

      if (previousSessions.isNotEmpty) {
        _lastVisibleBookingId = previousSessions.last.id;
      }
    } catch (error) {
      log('PreviousSessionsFetchFailure: $error');
      emit(
        PreviousSessionsFetchFailure(
          previousList: state.previousList,
          hasReachedEnd: state.hasReachedEnd,
        ),
      );
    }
  }

  void _onPreviousRefresh(
    PreviousSessionsRefreshRequested event,
    Emitter<PreviousSessionsState> emit,
  ) {
    _lastVisibleBookingId = null;
    emit(PreviousSessionsInitial());
    add(PreviousSessionsFetchRequested());
  }
}
