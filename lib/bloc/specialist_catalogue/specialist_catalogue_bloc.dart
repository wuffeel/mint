import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/usecase/fetch_specialists_online_use_case.dart';

part 'specialist_catalogue_event.dart';

part 'specialist_catalogue_state.dart';

@injectable
class SpecialistCatalogueBloc
    extends Bloc<SpecialistCatalogueEvent, SpecialistCatalogueState> {
  SpecialistCatalogueBloc(
    this._fetchSpecialistsOnlineUseCase,
  ) : super(SpecialistCatalogueInitial()) {
    on<SpecialistCatalogueFetchRequested>(_onSpecialistCatalogueFetch);
  }

  final FetchSpecialistsOnlineUseCase _fetchSpecialistsOnlineUseCase;

  Future<void> _onSpecialistCatalogueFetch(
    SpecialistCatalogueFetchRequested event,
    Emitter<SpecialistCatalogueState> emit,
  ) async {
    try {
      emit(SpecialistCatalogueLoading());
      final specialistList = await _fetchSpecialistsOnlineUseCase();
      emit(SpecialistCatalogueFetchSuccess(specialistList));
    } catch (error) {
      log('SpecialistCatalogueFailure: $error');
      emit(SpecialistCatalogueFetchFailure());
    }
  }
}
