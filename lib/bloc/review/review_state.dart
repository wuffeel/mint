part of 'review_bloc.dart';

@immutable
abstract class ReviewState {}

class ReviewInitial extends ReviewState {}

class ReviewLoading extends ReviewState {}

class ReviewFetchSuccess extends ReviewState {
  ReviewFetchSuccess(this.reviews);

  final List<ReviewModel> reviews;
}

class ReviewFetchFailure extends ReviewState {}

class ReviewAddSuccess extends ReviewFetchSuccess {
  ReviewAddSuccess(super.reviews);
}

class ReviewAddLoading extends ReviewFetchSuccess {
  ReviewAddLoading(super.reviews);
}

class ReviewAddUnselectedFailure extends ReviewFetchSuccess {
  ReviewAddUnselectedFailure(super.reviews);
}

class ReviewAddFailure extends ReviewFetchSuccess {
  ReviewAddFailure(super.reviews);
}

/// Unselected failure reset state
class ReviewSelectSuccess extends ReviewFetchSuccess {
  ReviewSelectSuccess(super.reviews);
}
