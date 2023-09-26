import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint_core/mint_core.dart';

import '../../domain/usecase/specialist_work_info_fetch_use_case.dart';

part 'work_info_event.dart';

part 'work_info_state.dart';

@injectable
class WorkInfoBloc extends Bloc<WorkInfoEvent, WorkInfoState> {
  WorkInfoBloc(
    this._specialistWorkInfoFetchUseCase,
  ) : super(WorkInfoInitial()) {
    on<WorkInfoFetchRequested>(_onWorkInfoRequest);
  }

  final SpecialistWorkInfoFetchUseCase _specialistWorkInfoFetchUseCase;

  Future<void> _onWorkInfoRequest(
    WorkInfoFetchRequested event,
    Emitter<WorkInfoState> emit,
  ) async {
    emit(WorkInfoFetchLoading());
    try {
      final workInfo = await _specialistWorkInfoFetchUseCase(
        event.specialistId,
      );
      emit(WorkInfoFetchSuccess(workInfo));
    } catch (error) {
      log('WorkInfoFetchFailure: $error');
      emit(WorkInfoFetchFailure());
    }
  }
}
