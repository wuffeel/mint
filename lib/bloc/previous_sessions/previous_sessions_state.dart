part of 'previous_sessions_bloc.dart';

@immutable
abstract class PreviousSessionsState {}

class PreviousSessionsInitial extends PreviousSessionsState {}

class PreviousSessionsFetchLoading extends PreviousSessionsState {}

class PreviousSessionsFetchSuccess extends PreviousSessionsState {
  PreviousSessionsFetchSuccess(this.previousList);

  final List<BookingData> previousList;
}

class PreviousSessionsFetchFailure extends PreviousSessionsState {}
