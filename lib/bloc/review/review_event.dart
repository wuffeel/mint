part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class ReviewFetchRequested extends ReviewEvent {
  ReviewFetchRequested(this.specialistId);

  final String specialistId;
}
