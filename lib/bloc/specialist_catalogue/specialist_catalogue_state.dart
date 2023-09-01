part of 'specialist_catalogue_bloc.dart';

@immutable
abstract class SpecialistCatalogueState {}

class SpecialistCatalogueInitial extends SpecialistCatalogueState {
  SpecialistCatalogueInitial({
    this.specialistList = const [],
    this.hasReachedEnd = false,
    this.preferences = FilterPreferences.empty,
  });

  final List<SpecialistModel> specialistList;
  final FilterPreferences preferences;

  /// Determines whether all specialists have been fetched
  final bool hasReachedEnd;
}

class SpecialistCatalogueFetchSuccess extends SpecialistCatalogueInitial {
  SpecialistCatalogueFetchSuccess({
    required super.specialistList,
    required super.hasReachedEnd,
    super.preferences,
  });
}

class SpecialistCatalogueLoading extends SpecialistCatalogueFetchSuccess {
  SpecialistCatalogueLoading({
    required super.specialistList,
    required super.hasReachedEnd,
    super.preferences,
  });
}

class SpecialistCatalogueFetchFailure extends SpecialistCatalogueFetchSuccess {
  SpecialistCatalogueFetchFailure({
    required super.specialistList,
    required super.hasReachedEnd,
    super.preferences,
  });
}
