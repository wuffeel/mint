part of 'upcoming_sessions_bloc.dart';

@immutable
abstract class UpcomingSessionsState {}

class UpcomingSessionsInitial extends UpcomingSessionsState {}

class UpcomingSessionsFetchLoading extends UpcomingSessionsState {}

class UpcomingSessionsFetchSuccess extends UpcomingSessionsState {
  UpcomingSessionsFetchSuccess(this.upcomingList, this.twoDaysList);

  final List<BookingData> upcomingList;

  /// List used to display only sessions upcoming withing the next two days
  final List<BookingData> twoDaysList;
}

class UpcomingSessionsFetchFailure extends UpcomingSessionsState {}
