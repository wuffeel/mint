part of 'specialist_catalogue_bloc.dart';

@immutable
abstract class SpecialistCatalogueEvent {}

class SpecialistCatalogueFetchRequested extends SpecialistCatalogueEvent {
  SpecialistCatalogueFetchRequested({
    this.preferences = FilterPreferences.empty,
  });

  final FilterPreferences preferences;
}

class SpecialistCatalogueRefreshRequested extends SpecialistCatalogueEvent {}

class SpecialistCatalogueRatingUpdated extends SpecialistCatalogueEvent {
  SpecialistCatalogueRatingUpdated(this.updatedRating);

  final SpecialistRating updatedRating;
}
