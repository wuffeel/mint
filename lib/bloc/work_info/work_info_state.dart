part of 'work_info_bloc.dart';

@immutable
abstract class WorkInfoState {}

class WorkInfoInitial extends WorkInfoState {}

class WorkInfoFetchLoading extends WorkInfoState {}

class WorkInfoFetchSuccess extends WorkInfoState {
  WorkInfoFetchSuccess(this.workInfo);

  final SpecialistWorkInfo workInfo;
}

class WorkInfoFetchFailure extends WorkInfoState {}
