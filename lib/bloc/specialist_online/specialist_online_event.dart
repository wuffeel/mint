part of 'specialist_online_bloc.dart';

@immutable
abstract class SpecialistOnlineEvent {}

class SpecialistOnlineFetchRequested extends SpecialistOnlineEvent {}

class SpecialistOnlineRatingUpdated extends SpecialistOnlineEvent {
  SpecialistOnlineRatingUpdated(this.updatedRating);

  final SpecialistRating updatedRating;
}
