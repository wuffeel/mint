import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/usecase/fetch_specialist_catalogue_use_case.dart';
import 'package:mint/utils/specialist_model_extensions.dart';

import '../../domain/controller/applied_filter_controller.dart';
import '../../domain/controller/specialist_rating_controller.dart';
import '../../domain/entity/filter_preferences/filter_preferences.dart';

part 'specialist_catalogue_event.dart';

part 'specialist_catalogue_state.dart';

@injectable
class SpecialistCatalogueBloc
    extends Bloc<SpecialistCatalogueEvent, SpecialistCatalogueState> {
  SpecialistCatalogueBloc(
    this._fetchSpecialistCatalogueUseCase,
    this._filterController,
    this._ratingController,
  ) : super(SpecialistCatalogueInitial()) {
    _subscribeToAppliedFilterChange();
    _subscribeToRatingChange();
    on<SpecialistCatalogueFetchRequested>(
      _onSpecialistCatalogueFetch,
      transformer: droppable(),
    );
    on<SpecialistCatalogueRefreshRequested>(
      _onSpecialistCatalogueRefresh,
      transformer: droppable(),
    );
    on<SpecialistCatalogueRatingUpdated>(_onRatingUpdate);
  }

  final FetchSpecialistCatalogueUseCase _fetchSpecialistCatalogueUseCase;

  final AppliedFilterController _filterController;
  late final StreamSubscription<FilterPreferences> _appliedSubscription;

  final SpecialistRatingController _ratingController;
  late final StreamSubscription<SpecialistRating> _ratingSubscription;

  /// Pagination end cursor
  String? _lastVisibleSpecialistId;

  /// Number of specialists to fetch
  static const _paginationLimit = 8;

  @override
  Future<void> close() async {
    await _appliedSubscription.cancel();
    await _ratingSubscription.cancel();
    return super.close();
  }

  /// Used to apply filters retrieved from 'Pick up specialist'
  void _subscribeToAppliedFilterChange() {
    _appliedSubscription =
        _filterController.appliedFilters.listen((appliedFilters) {
      add(SpecialistCatalogueRefreshRequested(preferences: appliedFilters));
    });
  }

  void _subscribeToRatingChange() {
    _ratingSubscription = _ratingController.rating.listen((newRating) {
      add(SpecialistCatalogueRatingUpdated(newRating));
    });
  }

  Future<void> _onSpecialistCatalogueFetch(
    SpecialistCatalogueFetchRequested event,
    Emitter<SpecialistCatalogueState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistCatalogueInitial) return;
    final preferences = event.preferences;
    try {
      await _fetchCatalogue(preferences, emit);
    } catch (error) {
      log('SpecialistCatalogueFetchError: $error');
      emit(
        SpecialistCatalogueFetchFailure(
          specialistList: state.specialistList,
          hasReachedEnd: state.hasReachedEnd,
          preferences: preferences,
        ),
      );
    }
  }

  Future<void> _onSpecialistCatalogueRefresh(
    SpecialistCatalogueRefreshRequested event,
    Emitter<SpecialistCatalogueState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistCatalogueInitial) return;
    final preferences = event.preferences ?? state.preferences;
    try {
      _refreshPaginationState(emit);
      await _fetchCatalogue(preferences, emit);
    } catch (error) {
      log('SpecialistCatalogueRefreshError: $error');
      emit(
        SpecialistCatalogueFetchFailure(
          specialistList: state.specialistList,
          hasReachedEnd: state.hasReachedEnd,
          preferences: preferences,
        ),
      );
    }
  }

  Future<void> _fetchCatalogue(
    FilterPreferences preferences,
    Emitter<SpecialistCatalogueState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistCatalogueInitial || state.hasReachedEnd) return;

    emit(
      SpecialistCatalogueLoading(
        specialistList: state.specialistList,
        hasReachedEnd: state.hasReachedEnd,
        preferences: preferences,
      ),
    );

    final specialistCatalogue = await _fetchSpecialistCatalogueUseCase(
      preferences,
      lastSpecialistId: _lastVisibleSpecialistId,
      limit: _paginationLimit,
    );
    final specializations = preferences.specializations;
    emit(
      SpecialistCatalogueFetchSuccess(
        specialistList: specializations != null
            ? [
                ...state.specialistList,
                ..._getSortedByMostOccurrencesList(
                  specialistCatalogue,
                  specializations,
                )
              ]
            : [...state.specialistList, ...specialistCatalogue],
        hasReachedEnd: specialistCatalogue.length < _paginationLimit,
        preferences: preferences,
      ),
    );

    if (specialistCatalogue.isNotEmpty) {
      _lastVisibleSpecialistId = specialistCatalogue.last.id;
    }
  }

  void _onRatingUpdate(
    SpecialistCatalogueRatingUpdated event,
    Emitter<SpecialistCatalogueState> emit,
  ) {
    final state = this.state;
    if (state is! SpecialistCatalogueFetchSuccess) return;

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
      SpecialistCatalogueFetchSuccess(
        specialistList: updatedSpecialists,
        hasReachedEnd: state.hasReachedEnd,
        preferences: state.preferences,
      ),
    );
  }

  List<SpecialistModel> _getSortedByMostOccurrencesList(
    List<SpecialistModel> specialistCatalogue,
    List<String> selectedSpecializations,
  ) {
    return specialistCatalogue.sortByMostOccurrences(
      selectedSpecializations: selectedSpecializations,
    );
  }

  void _refreshPaginationState(Emitter<SpecialistCatalogueState> emit) {
    _lastVisibleSpecialistId = null;
    emit(SpecialistCatalogueInitial());
  }
}
