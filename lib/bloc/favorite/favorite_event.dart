part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}

class FavoriteFetchRequested extends FavoriteEvent {}

class FavoriteAddRequested extends FavoriteEvent {
  FavoriteAddRequested(this.specialistModel);

  final SpecialistModel specialistModel;
}

class FavoriteRemoveRequested extends FavoriteEvent {
  FavoriteRemoveRequested(this.specialistModel);

  final SpecialistModel specialistModel;
}
