part of 'upcoming_consultations_bloc.dart';

@immutable
abstract class UpcomingConsultationsState {}

class UpcomingConsultationsInitial extends UpcomingConsultationsState {}

class UpcomingConsultationsFetchLoading extends UpcomingConsultationsState {}

class UpcomingConsultationsFetchSuccess extends UpcomingConsultationsState {
  UpcomingConsultationsFetchSuccess(this.upcomingList);

  final List<UpcomingConsultationData> upcomingList;
}

class UpcomingConsultationsFetchFailure extends UpcomingConsultationsState {}
