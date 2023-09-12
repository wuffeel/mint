import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/add_to_favorite_use_case.dart';
import 'package:mint/domain/usecase/fetch_favorite_list_use_case.dart';
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
    this._addToFavoriteUseCase,
    this._removeFromFavoriteUseCase,
  ) : super(FavoriteInitial()) {
    _subscribeToUserChange();
    on<FavoriteFetchRequested>(_onFavoriteFetch);
    on<FavoriteAddRequested>(_onFavoriteAdd);
    on<FavoriteRemoveRequested>(_onFavoriteRemove);
  }

  final FetchFavoriteListUseCase _fetchFavoriteListUseCase;
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

  Future<void> _onFavoriteFetch(
    FavoriteFetchRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;
    try {
      emit(FavoriteLoading());
      final favoriteList = await _fetchFavoriteListUseCase(user.id);
      emit(FavoriteFetchSuccess(favoriteList));
    } catch (error) {
      log('FavoriteFetchFailure: $error');
      emit(FavoriteFetchFailure());
    }
  }

  Future<void> _onFavoriteAdd(
    FavoriteAddRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    final localState = state;
    final user = _currentUser;
    if (localState is! FavoriteFetchSuccess || user == null) return;
    try {
      await _addToFavoriteUseCase(user.id, event.specialistModel.id);
      emit(
        FavoriteAddSuccess([
          ...localState.favoriteList,
          event.specialistModel,
        ]),
      );
    } catch (error) {
      log('FavoriteAddFailure: $error');
      emit(FavoriteAddFailure(localState.favoriteList));
    }
  }

  Future<void> _onFavoriteRemove(
    FavoriteRemoveRequested event,
    Emitter<FavoriteState> emit,
  ) async {
    final localState = state;
    final user = _currentUser;
    if (localState is! FavoriteFetchSuccess || user == null) return;
    try {
      await _removeFromFavoriteUseCase(user.id, event.specialistModel.id);
      emit(
        FavoriteRemoveSuccess(
          localState.favoriteList..remove(event.specialistModel),
        ),
      );
    } catch (error) {
      log('FavoriteRemoveFailure: $error');
      emit(FavoriteRemoveFailure(localState.favoriteList));
    }
  }
}
