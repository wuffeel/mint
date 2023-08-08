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

class ReviewUpdateRequested extends ReviewEvent {
  ReviewUpdateRequested(this.reviewModel);

  final ReviewModel reviewModel;
}

class ReviewDeleteRequested extends ReviewEvent {
  ReviewDeleteRequested(this.reviewModel);

  final ReviewModel reviewModel;
}

/// Event is used to reset the unselected state
class ReviewRatingSelected extends ReviewEvent {}
