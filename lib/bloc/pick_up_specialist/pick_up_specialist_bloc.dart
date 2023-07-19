import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/pick_up_filter_controller.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:mint/domain/entity/pick_up_filter/pick_up_filter.dart';
import 'package:mint/domain/entity/pick_up_preferences/pick_up_preferences.dart';
import 'package:mint/domain/usecase/fetch_pick_up_filter_use_case.dart';

part 'pick_up_specialist_event.dart';

part 'pick_up_specialist_state.dart';

@injectable
class PickUpSpecialistBloc
    extends Bloc<PickUpSpecialistEvent, PickUpSpecialistState> {
  PickUpSpecialistBloc(
    this._fetchPickUpFilterUseCase,
    this._filterController,
  ) : super(PickUpSpecialistLoading()) {
    on<PickUpSpecialistFilterRequested>(_onPickUpFilterRequested);
    on<PickUpSpecialistFilterSelected>(_onPickUpFilterSelected);
    on<PickUpSpecialistFilterFinished>(_onPickUpFilterFinished);
  }

  final FetchPickUpFilterUseCase _fetchPickUpFilterUseCase;

  final PickUpFilterController _filterController;

  Future<void> _onPickUpFilterRequested(
    PickUpSpecialistFilterRequested event,
    Emitter<PickUpSpecialistState> emit,
  ) async {
    try {
      final pickUpFilter = await _fetchPickUpFilterUseCase();
      emit(PickUpSpecialistLoadSuccess(pickUpFilter: pickUpFilter));
    } catch (error) {
      log('PickUpFilterFetchError: $error');
      emit(PickUpSpecialistLoadFailure());
    }
  }

  void _onPickUpFilterSelected(
    PickUpSpecialistFilterSelected event,
    Emitter<PickUpSpecialistState> emit,
  ) {
    final state = this.state;
    if (state is! PickUpSpecialistLoadSuccess) return;

    emit(
      PickUpSpecialistSelectSuccess(
        pickUpFilter: state.pickUpFilter,
        pickUpPreferences: event.pickUpPreferences,
      ),
    );
  }

  void _onPickUpFilterFinished(
    PickUpSpecialistFilterFinished event,
    Emitter<PickUpSpecialistState> emit,
  ) {
    final state = this.state;
    if (state is! PickUpSpecialistLoadSuccess) return;

    final preferences = state.pickUpPreferences;
    final specializations = preferences.specializations;
    _filterController.addToPickUpStream(
      FilterPreferences(
        lowPrice: preferences.priceRange?.lowPrice,
        highPrice: preferences.priceRange?.highPrice,
        specializations: specializations != null && specializations.isNotEmpty
            ? specializations
            : null,
      ),
    );
    emit(PickUpSpecialistApplySuccess());
  }
}
