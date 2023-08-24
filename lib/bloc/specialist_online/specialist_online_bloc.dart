import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/controller/specialist_rating_controller.dart';
import '../../domain/entity/specialist_model/specialist_model.dart';
import '../../domain/usecase/fetch_specialists_online_use_case.dart';

part 'specialist_online_event.dart';

part 'specialist_online_state.dart';

@injectable
class SpecialistOnlineBloc
    extends Bloc<SpecialistOnlineEvent, SpecialistOnlineState> {
  SpecialistOnlineBloc(
    this._fetchSpecialistsOnlineUseCase,
    this._ratingController,
  ) : super(SpecialistOnlineInitial()) {
    _subscribeToRatingChange();
    on<SpecialistOnlineFetchRequested>(
      _onSpecialistsOnlineFetch,
      transformer: droppable(),
    );
    on<SpecialistOnlineRefreshRequested>(
      _onSpecialistsOnlineRefresh,
      transformer: droppable(),
    );
    on<SpecialistOnlineRatingUpdated>(_onSpecialistReviewUpdate);
  }

  final FetchSpecialistsOnlineUseCase _fetchSpecialistsOnlineUseCase;

  final SpecialistRatingController _ratingController;
  late final StreamSubscription<SpecialistRating> _ratingSubscription;

  /// Pagination end cursor
  String? _lastVisibleSpecialistId;

  /// Number of specialists to fetch
  static const _paginationLimit = 6;

  void _subscribeToRatingChange() {
    _ratingSubscription = _ratingController.rating.listen((newRating) {
      add(SpecialistOnlineRatingUpdated(newRating));
    });
  }

  @override
  Future<void> close() async {
    await _ratingSubscription.cancel();
    return super.close();
  }

  Future<void> _onSpecialistsOnlineFetch(
    SpecialistOnlineFetchRequested event,
    Emitter<SpecialistOnlineState> emit,
  ) async {
    final state = this.state;
    if (state is SpecialistOnlineFetchSuccess && state.hasReachedEnd) return;

    state is SpecialistOnlineFetchSuccess
        ? await _fetchNextPage(state, emit)
        : await _fetchFirstPage(emit);
  }

  void _onSpecialistsOnlineRefresh(
    SpecialistOnlineRefreshRequested event,
    Emitter<SpecialistOnlineState> emit,
  ) {
    _lastVisibleSpecialistId = null;
    emit(SpecialistOnlineInitial());
    add(SpecialistOnlineFetchRequested());
  }

  void _onSpecialistReviewUpdate(
    SpecialistOnlineRatingUpdated event,
    Emitter<SpecialistOnlineState> emit,
  ) {
    final state = this.state;
    if (state is! SpecialistOnlineFetchSuccess) return;

    final specialists = state.specialistList;
    if (specialists.isEmpty) return;

    final updatedSpecialists = specialists.map((specialist) {
      final newRating = event.updatedRating;
      if (specialist.id == newRating.specialistId) {
        return specialist.copyWith(
          rating: newRating.rating,
          reviewCount: newRating.reviewCount,
        );
      }
      return specialist;
    }).toList();

    emit(
      SpecialistOnlineFetchSuccess(
        updatedSpecialists,
        hasReachedEnd: state.hasReachedEnd,
      ),
    );
  }

  Future<void> _fetchFirstPage(Emitter<SpecialistOnlineState> emit) async {
    try {
      emit(SpecialistOnlineListLoading());

      final specialistList = await _fetchSpecialistsOnlineUseCase(
        lastSpecialistId: _lastVisibleSpecialistId,
        limit: _paginationLimit,
      );
      emit(
        SpecialistOnlineFetchSuccess(
          specialistList,
          hasReachedEnd: specialistList.length < _paginationLimit,
        ),
      );

      if (specialistList.isNotEmpty) {
        _lastVisibleSpecialistId = specialistList.last.id;
      }
    } catch (error) {
      log('SpecialistOnlineFetchFailure: $error');
      emit(SpecialistOnlineFetchFailure());
    }
  }

  Future<void> _fetchNextPage(
    SpecialistOnlineFetchSuccess state,
    Emitter<SpecialistOnlineState> emit,
  ) async {
    try {
      emit(
        SpecialistOnlinePageLoading(
          state.specialistList,
          hasReachedEnd: state.hasReachedEnd,
        ),
      );

      final specialistList = await _fetchSpecialistsOnlineUseCase(
        lastSpecialistId: _lastVisibleSpecialistId,
        limit: _paginationLimit,
      );

      emit(
        SpecialistOnlineFetchSuccess(
          [...state.specialistList, ...specialistList],
          hasReachedEnd: specialistList.length < _paginationLimit,
        ),
      );

      if (specialistList.isNotEmpty) {
        _lastVisibleSpecialistId = specialistList.last.id;
      }
    } catch (error) {
      log('SpecialistOnlineFetchPageFailure: $error');
      emit(
        SpecialistOnlineFetchPageFailure(
          state.specialistList,
          hasReachedEnd: state.hasReachedEnd,
        ),
      );
    }
  }
}
