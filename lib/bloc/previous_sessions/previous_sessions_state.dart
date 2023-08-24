part of 'previous_sessions_bloc.dart';

@immutable
abstract class PreviousSessionsState {}

class PreviousSessionsInitial extends PreviousSessionsState {
  PreviousSessionsInitial({
    this.previousList = const [],
    this.hasReachedEnd = false,
  });

  final List<BookingData> previousList;

  /// Determines whether all previous sessions have been fetched
  final bool hasReachedEnd;
}

class PreviousSessionsFetchSuccess extends PreviousSessionsInitial {
  PreviousSessionsFetchSuccess({
    required super.previousList,
    required super.hasReachedEnd,
  });
}

class PreviousSessionsFetchLoading extends PreviousSessionsFetchSuccess {
  PreviousSessionsFetchLoading({
    required super.previousList,
    required super.hasReachedEnd,
  });
}

class PreviousSessionsFetchFailure extends PreviousSessionsFetchSuccess {
  PreviousSessionsFetchFailure({
    required super.previousList,
    required super.hasReachedEnd,
  });
}
