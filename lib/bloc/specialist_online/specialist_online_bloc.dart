import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
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
    on<SpecialistOnlineFetchRequested>(_onSpecialistsOnlineFetch);
    on<SpecialistOnlineRatingUpdated>(_onSpecialistReviewUpdate);
  }

  final FetchSpecialistsOnlineUseCase _fetchSpecialistsOnlineUseCase;

  final SpecialistRatingController _ratingController;
  late final StreamSubscription<SpecialistRating> _ratingSubscription;

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
    try {
      emit(SpecialistOnlineLoading());
      final specialistList = await _fetchSpecialistsOnlineUseCase();
      emit(SpecialistOnlineFetchSuccess(specialistList));
    } catch (error) {
      log('SpecialistOnlineFailure: $error');
      emit(SpecialistOnlineFetchFailure());
    }
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
      final rating = event.updatedRating;
      if (specialist.id == rating.$3) {
        return specialist.copyWith(rating: rating.$1, reviewCount: rating.$2);
      }
      return specialist;
    }).toList();

    emit(SpecialistOnlineFetchSuccess(updatedSpecialists));
  }
}
