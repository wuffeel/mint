part of 'work_info_bloc.dart';

@immutable
abstract class WorkInfoEvent {}

class WorkInfoFetchRequested extends WorkInfoEvent {
  WorkInfoFetchRequested(this.specialistId, {this.isReschedule = false});

  final String specialistId;
  final bool isReschedule;
}
