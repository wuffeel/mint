import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/applied_filter_controller.dart';
import 'package:mint/domain/controller/pick_up_filter_controller.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart';
import 'package:mint/domain/usecase/fetch_specialist_filter_use_case.dart';

part 'specialist_filter_event.dart';

part 'specialist_filter_state.dart';

@injectable
class SpecialistFilterBloc
    extends Bloc<SpecialistFilterEvent, SpecialistFilterState> {
  SpecialistFilterBloc(
    this._fetchSpecialistFilterUseCase,
    this._filterController,
    this._pickUpController,
  ) : super(SpecialistFilterInitial()) {
    _subscribeToPickUpFilterChange();
    on<SpecialistFilterFetchRequested>(_onSpecialistFilterFetch);
    on<SpecialistFilterSelected>(_onSpecialistFilterSelect);
    on<SpecialistFilterApplied>(_onSpecialistFilterApply);
    on<SpecialistFilterClearRequested>(_onSpecialistFilterClear);
    on<SpecialistFilterGetSelected>(_onGetSelected);
  }

  final FetchSpecialistFilterUseCase _fetchSpecialistFilterUseCase;

  final AppliedFilterController _filterController;
  final PickUpFilterController _pickUpController;
  late final StreamSubscription<FilterPreferences> _pickUpSubscription;

  @override
  Future<void> close() async {
    await _pickUpSubscription.cancel();
    return super.close();
  }

  /// Used to apply filters retrieved from 'Pick up specialist'
  void _subscribeToPickUpFilterChange() {
    _pickUpSubscription =
        _pickUpController.pickUpFilters.listen((appliedFilters) {
      add(SpecialistFilterApplied(appliedFilters: appliedFilters));
    });
  }

  Future<void> _onSpecialistFilterFetch(
    SpecialistFilterFetchRequested event,
    Emitter<SpecialistFilterState> emit,
  ) async {
    emit(SpecialistFilterLoading());
    try {
      final specialistFilter = await _fetchSpecialistFilterUseCase();

      final state = this.state;
      if (state is SpecialistFilterLoadSuccess) {
        // If fetching filters after 'Pick up specialist'
        emit(
          SpecialistFilterLoadSuccess(
            specialistFilter: specialistFilter,
            appliedFilters: state.appliedFilters,
            selectedFilters: state.appliedFilters,
          ),
        );
      } else {
        emit(SpecialistFilterLoadSuccess(specialistFilter: specialistFilter));
      }
    } catch (error) {
      log('SpecialistFilterFetchFailure: $error');
      emit(SpecialistFilterFetchFailure());
    }
  }

  void _onSpecialistFilterSelect(
    SpecialistFilterSelected event,
    Emitter<SpecialistFilterState> emit,
  ) {
    final state = this.state;
    if (state is! SpecialistFilterLoadSuccess) return;

    emit(
      SpecialistFilterSelectSuccess(
        selectedFilters: event.selectedFilters,
        specialistFilter: state.specialistFilter,
        appliedFilters: state.appliedFilters,
      ),
    );
  }

  /// Used to apply received filters.
  ///
  /// If [event]'s not empty, then 'Pick up specialist' filters
  /// received
  void _onSpecialistFilterApply(
    SpecialistFilterApplied event,
    Emitter<SpecialistFilterState> emit,
  ) {
    final state = this.state;

    if (state is SpecialistFilterLoadSuccess) {
      final currentPreferences = event.appliedFilters.isEmpty
          ? state.selectedFilters
          : event.appliedFilters;

      _filterController.addToAppliedStream(currentPreferences);
      emit(
        SpecialistFilterApplySuccess(
          appliedFilters: state.selectedFilters,
          selectedFilters: state.selectedFilters,
          specialistFilter: state.specialistFilter,
        ),
      );
    } else {
      _filterController.addToAppliedStream(event.appliedFilters);
      emit(SpecialistFilterApplySuccess(appliedFilters: event.appliedFilters));
    }
  }

  /// Emits state with selected filters as [FilterPreferences.empty]
  void _onSpecialistFilterClear(
    SpecialistFilterClearRequested event,
    Emitter<SpecialistFilterState> emit,
  ) {
    final state = this.state;
    if (state is! SpecialistFilterLoadSuccess) return;

    emit(
      SpecialistFilterLoadSuccess(
        specialistFilter: state.specialistFilter,
        appliedFilters: state.appliedFilters,
      ),
    );
  }

  void _onGetSelected(
    SpecialistFilterGetSelected event,
    Emitter<SpecialistFilterState> emit,
  ) {
    final state = this.state;
    if (state is! SpecialistFilterLoadSuccess) return;

    emit(
      SpecialistFilterLoadSuccess(
        specialistFilter: state.specialistFilter,
        appliedFilters: state.appliedFilters,
        selectedFilters: state.appliedFilters,
      ),
    );
  }
}
