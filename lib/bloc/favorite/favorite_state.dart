part of 'favorite_bloc.dart';

enum FavoriteLoadingType { ids, specialists }

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {
  FavoriteLoading(this.loadingType);

  final FavoriteLoadingType loadingType;
}

class FavoriteFetchIdsFailure extends FavoriteState {}

class FavoriteFetchSpecialistsFailure extends FavoriteState {}

class FavoriteFetchSuccess extends FavoriteState {
  FavoriteFetchSuccess(
    this.favoriteIdsList, {
    this.favoriteSpecialists = const [],
  });

  final List<String> favoriteIdsList;
  final List<SpecialistModel> favoriteSpecialists;
}

class FavoriteToggleLoading extends FavoriteFetchSuccess {
  FavoriteToggleLoading(
    super.favoriteList, {
    required super.favoriteSpecialists,
  });
}

class FavoriteToggleSuccess extends FavoriteFetchSuccess {
  FavoriteToggleSuccess(
    super.favoriteList, {
    required super.favoriteSpecialists,
  });
}

class FavoriteToggleFailure extends FavoriteFetchSuccess {
  FavoriteToggleFailure(
    super.favoriteList, {
    required super.favoriteSpecialists,
    required this.isFavorite,
  });

  final bool isFavorite;
}
