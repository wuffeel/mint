part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewFetchSuccess extends ReviewState {
  ReviewFetchSuccess(this.reviews, this.userReview);

  final List<ReviewModel> reviews;

  /// Used to be shown as the user's review if exists
  final ReviewModel? userReview;
}

class ReviewFetchFailure extends ReviewState {}

class ReviewAddSuccess extends ReviewFetchSuccess {
  ReviewAddSuccess(super.reviews, super.userReview);
}

class ReviewAddLoading extends ReviewFetchSuccess {
  ReviewAddLoading(super.reviews, super.userReview);
}

class ReviewAddUnselectedFailure extends ReviewFetchSuccess {
  ReviewAddUnselectedFailure(super.reviews, super.userReview);
}

class ReviewAddFailure extends ReviewFetchSuccess {
  ReviewAddFailure(super.reviews, super.userReview);
}

/// Unselected failure reset state
class ReviewSelectSuccess extends ReviewFetchSuccess {
  ReviewSelectSuccess(super.reviews, super.userReview);
}
