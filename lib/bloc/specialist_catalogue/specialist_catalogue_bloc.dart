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
      transformer: restartable(),
    );
    on<SpecialistCatalogueRefreshRequested>(_onSpecialistCatalogueRefresh);
    on<SpecialistCatalogueRatingUpdated>(_onRatingUpdate);
  }

  final FetchSpecialistCatalogueUseCase _fetchSpecialistCatalogueUseCase;

  final AppliedFilterController _filterController;
  late final StreamSubscription<FilterPreferences> _appliedSubscription;

  final SpecialistRatingController _ratingController;
  late final StreamSubscription<SpecialistRating> _ratingSubscription;

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
      add(SpecialistCatalogueFetchRequested(preferences: appliedFilters));
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
    final preferences = event.preferences;
    try {
      await _fetchCatalogue(preferences, emit);
    } catch (error) {
      log('SpecialistCatalogueFetchError: $error');
      emit(SpecialistCatalogueFetchFailure(preferences: preferences));
    }
  }

  Future<void> _onSpecialistCatalogueRefresh(
    SpecialistCatalogueRefreshRequested event,
    Emitter<SpecialistCatalogueState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistCatalogueInitial) return;
    final preferences = state.preferences;
    try {
      await _fetchCatalogue(preferences, emit);
    } catch (error) {
      log('SpecialistCatalogueRefreshError: $error');
      emit(SpecialistCatalogueFetchFailure(preferences: preferences));
    }
  }

  Future<void> _fetchCatalogue(
    FilterPreferences preferences,
    Emitter<SpecialistCatalogueState> emit,
  ) async {
    final state = this.state;
    if (state is! SpecialistCatalogueInitial) return;

    emit(
      SpecialistCatalogueLoading(
        specialistList: state.specialistList,
        preferences: preferences,
      ),
    );

    final specialistCatalogue = await _fetchSpecialistCatalogueUseCase(
      preferences,
    );
    final specializations = preferences.specializations;
    emit(
      SpecialistCatalogueFetchSuccess(
        specialistList: specializations != null
            ? specialistCatalogue.sortByMostOccurrences(
                selectedSpecializations: specializations,
              )
            : specialistCatalogue,
        preferences: preferences,
      ),
    );
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
        preferences: state.preferences,
      ),
    );
  }
}
