part of 'specialist_catalogue_bloc.dart';

@immutable
abstract class SpecialistCatalogueState {}

class SpecialistCatalogueInitial extends SpecialistCatalogueState {
  SpecialistCatalogueInitial({
    this.specialistList = const [],
    this.preferences = FilterPreferences.empty,
  });

  final List<SpecialistModel> specialistList;
  final FilterPreferences preferences;
}

class SpecialistCatalogueLoading extends SpecialistCatalogueInitial {
  SpecialistCatalogueLoading({super.specialistList, super.preferences});
}

class SpecialistCatalogueFetchSuccess extends SpecialistCatalogueInitial {
  SpecialistCatalogueFetchSuccess({
    required super.specialistList,
    super.preferences,
  });
}

class SpecialistCatalogueFetchFailure extends SpecialistCatalogueInitial {
  SpecialistCatalogueFetchFailure({super.specialistList, super.preferences});
}
