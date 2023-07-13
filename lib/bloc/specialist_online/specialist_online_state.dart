part of 'specialist_online_bloc.dart';

@immutable
abstract class SpecialistOnlineState {}

class SpecialistOnlineInitial extends SpecialistOnlineState {}

class SpecialistOnlineLoading extends SpecialistOnlineState {}

class SpecialistOnlineFetchSuccess extends SpecialistOnlineState {
  SpecialistOnlineFetchSuccess(this.specialistList);

  final List<SpecialistModel> specialistList;
}

class SpecialistOnlineFetchFailure extends SpecialistOnlineState {}
