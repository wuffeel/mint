part of 'upcoming_sessions_bloc.dart';

@immutable
abstract class UpcomingSessionsState {}

class UpcomingSessionsInitial extends UpcomingSessionsState {}

class UpcomingSessionsFetchLoading extends UpcomingSessionsState {}

class UpcomingSessionsFetchSuccess extends UpcomingSessionsState {
  UpcomingSessionsFetchSuccess(this.upcomingList);

  final List<BookingData> upcomingList;
}

class UpcomingSessionsFetchFailure extends UpcomingSessionsState {}
