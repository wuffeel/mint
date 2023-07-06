part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteFetchSuccess extends FavoriteState {
  FavoriteFetchSuccess(this.favoriteList);

  final List<SpecialistModel> favoriteList;
}

class FavoriteAddSuccess extends FavoriteFetchSuccess {
  FavoriteAddSuccess(super.favoriteList);
}

class FavoriteAddFailure extends FavoriteFetchSuccess {
  FavoriteAddFailure(super.favoriteList);
}

class FavoriteRemoveSuccess extends FavoriteFetchSuccess {
  FavoriteRemoveSuccess(super.favoriteList);
}

class FavoriteRemoveFailure extends FavoriteFetchSuccess {
  FavoriteRemoveFailure(super.favoriteList);
}

class FavoriteFetchFailure extends FavoriteState {}
