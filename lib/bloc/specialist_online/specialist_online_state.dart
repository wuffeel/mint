part of 'specialist_online_bloc.dart';

@immutable
abstract class SpecialistOnlineState {}

class SpecialistOnlineInitial extends SpecialistOnlineState {}

class SpecialistOnlineListLoading extends SpecialistOnlineState {}

class SpecialistOnlineFetchSuccess extends SpecialistOnlineState {
  SpecialistOnlineFetchSuccess(
    this.specialistList, {
    required this.hasReachedEnd,
  });

  final List<SpecialistModel> specialistList;

  /// Determines whether all specialists have been fetched
  final bool hasReachedEnd;
}

class SpecialistOnlinePageLoading extends SpecialistOnlineFetchSuccess {
  SpecialistOnlinePageLoading(
    super.specialistList, {
    required super.hasReachedEnd,
  });
}

class SpecialistOnlineFetchPageFailure extends SpecialistOnlineFetchSuccess {
  SpecialistOnlineFetchPageFailure(
    super.specialistList, {
    required super.hasReachedEnd,
  });
}

class SpecialistOnlineFetchFailure extends SpecialistOnlineState {}
