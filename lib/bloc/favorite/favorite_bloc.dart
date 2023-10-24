import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart';
import 'package:mint/domain/usecase/fetch_favorite_ids_use_case.dart';
import 'package:mint/domain/usecase/fetch_favorite_specialists_use_case.dart';
import 'package:mint/domain/usecase/remove_from_favorite_use_case.dart';
import 'package:mint_core/mint_bloc.dart';
import 'package:mint_core/mint_core.dart';

part 'favorite_event.dart';

part 'favorite_state.dart';

@injectable
class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  FavoriteBloc(
    this._userController,
    this._fetchFavoriteListUseCase,
    this._fetchFavoriteSpecialistsUseCase,
    this._addToFavoriteUseCase,
    this._removeFromFavoriteUseCase,
  ) : super(FavoriteInitial()) {
    _subscribeToUserChange();
    on<FavoriteFetchIdsRequested>(_onFavoriteIdsFetch);
    on<FavoriteFetchSpecialistsRequested>(_onFavoriteSpecialistsFetch);
    on<FavoriteToggleRequested>(_onFavoriteToggle);
  }

  final FetchFavoriteIdsUseCase _fetchFavoriteListUseCase;
  final FetchFavoriteSpecialistsUseCase _fetchFavoriteSpecialistsUseCase;
  final AddToFavoriteUseCase _addToFavoriteUseCase;
  final RemoveFromFavoriteUseCase _removeFromFavoriteUseCase;

  PatientUser? _currentUser;
  final UserController<PatientUser?> _userController;
  late final StreamSubscription<PatientUser?> _userSubscription;

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

  Future<void> _onFavoriteIdsFetch(
    FavoriteFetchIdsRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(FavoriteLoading(FavoriteLoadingType.ids));
      final favoriteIdsList = await _fetchFavoriteListUseCase(user.id);
      emit(FavoriteFetchSuccess(favoriteIdsList));
    } catch (error) {
      log('FavoriteFetchIdsFailure: $error');
      emit(FavoriteFetchIdsFailure());
    }
  }

  Future<void> _onFavoriteSpecialistsFetch(
    FavoriteFetchSpecialistsRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    final user = _currentUser;
    final state = this.state;
    if (user == null || state is! FavoriteFetchSuccess) return;
    if (_allIdsPresent(state.favoriteIdsList, state.favoriteSpecialists)) {
      return;
    }

    try {
      emit(FavoriteLoading(FavoriteLoadingType.specialists));
      final favoriteIds = state.favoriteIdsList;
      final favorites = await _fetchFavoriteSpecialistsUseCase(favoriteIds);
      emit(FavoriteFetchSuccess(favoriteIds, favoriteSpecialists: favorites));
    } catch (error) {
      log('FavoriteFetchSpecialistsFailure: $error');
      emit(FavoriteFetchSpecialistsFailure());
    }
  }

  Future<void> _onFavoriteToggle(
    FavoriteToggleRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    final state = this.state;
    final user = _currentUser;
    if (state is! FavoriteFetchSuccess || user == null) return;
    try {
      emit(
        FavoriteToggleLoading(
          state.favoriteIdsList,
          favoriteSpecialists: state.favoriteSpecialists,
        ),
      );

      final specialistId = event.specialistModel.id;
      final isFavorite = event.isFavorite;
      isFavorite
          ? await _removeFromFavoriteUseCase(user.id, specialistId)
          : await _addToFavoriteUseCase(user.id, specialistId);

      emit(_toggleSuccessState(state, isFavorite, event.specialistModel));
    } catch (error) {
      log('FavoriteToggleFailure: $error');
      emit(
        FavoriteToggleFailure(
          state.favoriteIdsList,
          favoriteSpecialists: state.favoriteSpecialists,
          isFavorite: event.isFavorite,
        ),
      );
    }
  }

  FavoriteFetchSuccess _toggleSuccessState(
    FavoriteFetchSuccess state,
    bool isFavorite,
    SpecialistModel specialistModel,
  ) {
    final specialistId = specialistModel.id;
    final favoriteIds = [...state.favoriteIdsList];
    final favoriteSpecialists = [...state.favoriteSpecialists];

    if (isFavorite) {
      favoriteIds.remove(specialistId);
      favoriteSpecialists.removeWhere((e) => e.id == specialistId);
    } else {
      favoriteIds.insert(0, specialistId);
      favoriteSpecialists.insert(0, specialistModel);
    }

    return FavoriteFetchSuccess(
      favoriteIds,
      favoriteSpecialists: favoriteSpecialists,
    );
  }

  /// Checks if all IDs from [favoriteIdsList] are present in
  /// [favoriteSpecialists]
  bool _allIdsPresent(
    List<String> favoriteIdsList,
    List<SpecialistModel> favoriteSpecialists,
  ) {
    // Create a Set of specialist IDs for efficient lookup
    final specialistIdsSet =
        favoriteSpecialists.map((specialist) => specialist.id).toSet();

    return favoriteIdsList.every(specialistIdsSet.contains);
  }
}
