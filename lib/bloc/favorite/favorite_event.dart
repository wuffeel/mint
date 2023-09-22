part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteFetchIdsRequested extends FavoriteEvent {}

class FavoriteFetchSpecialistsRequested extends FavoriteEvent {}

class FavoriteToggleRequested extends FavoriteEvent {
  FavoriteToggleRequested(this.specialistModel, {required this.isFavorite});

  final SpecialistModel specialistModel;
  final bool isFavorite;
}
