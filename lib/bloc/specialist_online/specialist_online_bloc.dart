import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entity/specialist_model/specialist_model.dart';
import '../../domain/usecase/fetch_specialists_online_use_case.dart';

part 'specialist_online_event.dart';

part 'specialist_online_state.dart';

@injectable
class SpecialistOnlineBloc
    extends Bloc<SpecialistOnlineEvent, SpecialistOnlineState> {
  SpecialistOnlineBloc(
    this._fetchSpecialistsOnlineUseCase,
  ) : super(SpecialistOnlineInitial()) {
    on<SpecialistOnlineFetchRequested>(_onSpecialistCatalogueFetch);
  }

  final FetchSpecialistsOnlineUseCase _fetchSpecialistsOnlineUseCase;

  Future<void> _onSpecialistCatalogueFetch(
    SpecialistOnlineFetchRequested event,
    Emitter<SpecialistOnlineState> emit,
  ) async {
    try {
      emit(SpecialistOnlineLoading());
      final specialistList = await _fetchSpecialistsOnlineUseCase();
      emit(SpecialistOnlineFetchSuccess(specialistList));
    } catch (error) {
      log('SpecialistOnlineFailure: $error');
      emit(SpecialistOnlineFetchFailure());
    }
  }
}
