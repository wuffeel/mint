part of 'specialist_filter_bloc.dart';

@immutable
abstract class SpecialistFilterState {}

class SpecialistFilterInitial extends SpecialistFilterState {}

class SpecialistFilterLoading extends SpecialistFilterState {}

class SpecialistFilterLoadSuccess extends SpecialistFilterState {
  SpecialistFilterLoadSuccess({
    this.specialistFilter = SpecialistFilter.empty,
    this.appliedFilters = FilterPreferences.empty,
    this.selectedFilters = FilterPreferences.empty,
  });

  final SpecialistFilter specialistFilter;
  final FilterPreferences appliedFilters;
  final FilterPreferences selectedFilters;
}

class SpecialistFilterFetchFailure extends SpecialistFilterState {}

class SpecialistFilterApplySuccess extends SpecialistFilterLoadSuccess {
  SpecialistFilterApplySuccess({
    required super.appliedFilters,
    super.specialistFilter,
    super.selectedFilters,
  });
}

class SpecialistFilterSelectSuccess extends SpecialistFilterLoadSuccess {
  SpecialistFilterSelectSuccess({
    required super.selectedFilters,
    super.appliedFilters,
    super.specialistFilter,
  });
}
