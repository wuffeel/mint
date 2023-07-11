part of 'specialist_catalogue_bloc.dart';

@immutable
abstract class SpecialistCatalogueState {}

class SpecialistCatalogueInitial extends SpecialistCatalogueState {}

class SpecialistCatalogueLoading extends SpecialistCatalogueState {}

class SpecialistCatalogueFetchSuccess extends SpecialistCatalogueState {
  SpecialistCatalogueFetchSuccess(this.specialistList);

  final List<SpecialistModel> specialistList;
}

class SpecialistCatalogueFetchFailure extends SpecialistCatalogueState {}
