part of 'review_bloc.dart';

@immutable
abstract class ReviewEvent {}

class ReviewFetchRequested extends ReviewEvent {
  ReviewFetchRequested(this.specialistId);

  final String specialistId;
}

class ReviewAddRequested extends ReviewEvent {
  ReviewAddRequested({
    required this.specialistId,
    required this.rating,
    this.content,
  });

  final String specialistId;
  final double? rating;
  final String? content;
}

/// Event is used to reset the unselected state
class ReviewRatingSelected extends ReviewEvent {}
