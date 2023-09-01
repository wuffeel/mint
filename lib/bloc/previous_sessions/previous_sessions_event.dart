part of 'previous_sessions_bloc.dart';

@immutable
abstract class PreviousSessionsEvent {}

class PreviousSessionsFetchRequested extends PreviousSessionsEvent {}

class PreviousSessionsRefreshRequested extends PreviousSessionsEvent {}
