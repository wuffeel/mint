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
