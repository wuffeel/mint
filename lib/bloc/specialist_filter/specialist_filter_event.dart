part of 'specialist_filter_bloc.dart';

@immutable
abstract class SpecialistFilterEvent {}

class SpecialistFilterFetchRequested extends SpecialistFilterEvent {}

class SpecialistFilterSelected extends SpecialistFilterEvent {
  SpecialistFilterSelected(this.selectedFilters);

  final FilterPreferences selectedFilters;
}

class SpecialistFilterApplied extends SpecialistFilterEvent {
  SpecialistFilterApplied({this.appliedFilters = FilterPreferences.empty});

  /// Value currently used only for applying filters with 'Pick up specialist'
  ///
  /// Otherwise, the current state's selected filters are applied
  final FilterPreferences appliedFilters;
}

class SpecialistFilterClearRequested extends SpecialistFilterEvent {}

/// Event used to display currently applied filters on opening filter
/// bottom sheet
class SpecialistFilterGetSelected extends SpecialistFilterEvent {}
