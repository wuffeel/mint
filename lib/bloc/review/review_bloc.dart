import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/add_review_use_case.dart';
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/review_model/review_model.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'review_event.dart';

part 'review_state.dart';

// TODO(wuffeel): do we need a user controller here to handle user name changes?
@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc(
    this._fetchSpecialistReviewsUseCase,
    this._addReviewUseCase,
    this._userController,
  ) : super(ReviewInitial()) {
    _subscribeToUserChange();
    on<ReviewFetchRequested>(_onReviewFetch);
    on<ReviewAddRequested>(_onAddReview);
    on<ReviewRatingSelected>(_onRatingSelect);
  }

  final FetchSpecialistReviewsUseCase _fetchSpecialistReviewsUseCase;
  final AddReviewUseCase _addReviewUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onReviewFetch(
    ReviewFetchRequested event,
    Emitter<ReviewState> emit,
  ) async {
    emit(ReviewLoading());
    try {
      final reviews = await _fetchSpecialistReviewsUseCase(event.specialistId);
      emit(ReviewFetchSuccess(reviews));
    } catch (error) {
      log('ReviewFetchFailure: $error');
      emit(ReviewFetchFailure());
    }
  }

  Future<void> _onAddReview(
    ReviewAddRequested event,
    Emitter<ReviewState> emit,
  ) async {
    final state = this.state;
    final user = _currentUser;
    if (state is! ReviewFetchSuccess || user == null) return;
    final rating = event.rating;
    if (rating == null) {
      emit(ReviewAddUnselectedFailure(state.reviews));
      return;
    }
    try {
      final review = ReviewModel(
        user: user,
        specialistId: event.specialistId,
        rating: rating,
        createdAt: DateTime.now(),
        content: event.content,
      );
      emit(ReviewAddLoading(state.reviews));
      await _addReviewUseCase(review);
      final reviews = state.reviews;
      final hasUserReview =
          reviews.any((element) => element.user.id == user.id);

      // If user already left a review, update it. If didn't, add new review
      final updatedReviews = hasUserReview
          ? reviews
              .map((element) => element.user.id == user.id ? review : element)
              .toList()
          : [...reviews, review];

      emit(ReviewAddSuccess(updatedReviews));
    } catch (error) {
      log('ReviewAddFailure: $error');
      emit(ReviewAddFailure(state.reviews));
    }
  }

  void _onRatingSelect(ReviewRatingSelected event, Emitter<ReviewState> emit) {
    final state = this.state;
    if (state is! ReviewFetchSuccess) return;
    emit(ReviewSelectSuccess(state.reviews));
  }
}
