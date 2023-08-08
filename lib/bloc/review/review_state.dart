part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewFetchSuccess extends ReviewState {
  ReviewFetchSuccess(this.reviews, this.userReviews);

  final List<ReviewModel> reviews;

  /// Used to be shown as the user's reviews if exists
  final List<ReviewModel> userReviews;
}

class ReviewFetchFailure extends ReviewState {}

class ReviewAddSuccess extends ReviewFetchSuccess {
  ReviewAddSuccess(super.reviews, super.userReviews);
}

class ReviewAddLoading extends ReviewFetchSuccess {
  ReviewAddLoading(super.reviews, super.userReviews);
}

class ReviewAddUnselectedFailure extends ReviewFetchSuccess {
  ReviewAddUnselectedFailure(super.reviews, super.userReviews);
}

class ReviewAddFailure extends ReviewFetchSuccess {
  ReviewAddFailure(super.reviews, super.userReviews);
}

class ReviewDeleteSuccess extends ReviewFetchSuccess {
  ReviewDeleteSuccess(super.reviews, super.userReviews);
}

class ReviewDeleteFailure extends ReviewFetchSuccess {
  ReviewDeleteFailure(super.reviews, super.userReviews);
}

/// Unselected failure reset state
class ReviewSelectSuccess extends ReviewFetchSuccess {
  ReviewSelectSuccess(super.reviews, super.userReviews);
}
