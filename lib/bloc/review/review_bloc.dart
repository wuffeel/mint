import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/specialist_rating_controller.dart';
import 'package:mint/domain/usecase/add_review_use_case.dart';
import 'package:mint/domain/usecase/fetch_specialist_reviews_use_case.dart';
import 'package:mint/domain/usecase/update_review_use_case.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/review_model/review_model.dart';
import '../../domain/entity/user_model/user_model.dart';
import '../../domain/usecase/delete_review_use_case.dart';

part 'review_event.dart';

part 'review_state.dart';

// TODO(wuffeel): do we need a user controller here to handle user name changes?
@injectable
class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc(
    this._fetchSpecialistReviewsUseCase,
    this._addReviewUseCase,
    this._userController,
    this._specialistRatingController,
    this._updateReviewUseCase,
    this._deleteReviewUseCase,
  ) : super(ReviewInitial()) {
    _subscribeToUserChange();
    on<ReviewFetchRequested>(_onReviewFetch);
    on<ReviewAddRequested>(_onAddReview);
    on<ReviewRatingSelected>(_onRatingSelect);
    on<ReviewUpdateRequested>(_onUpdateReview);
    on<ReviewDeleteRequested>(_onDeleteReview);
  }

  final FetchSpecialistReviewsUseCase _fetchSpecialistReviewsUseCase;
  final AddReviewUseCase _addReviewUseCase;
  final UpdateReviewUseCase _updateReviewUseCase;
  final DeleteReviewUseCase _deleteReviewUseCase;

  UserModel? _currentUser;
  final UserController _userController;
  final SpecialistRatingController _specialistRatingController;

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
    final user = _currentUser;
    if (user == null) return;
    emit(ReviewLoading());
    try {
      final reviews = await _fetchSpecialistReviewsUseCase(event.specialistId);
      final userReviews = reviews.where((review) {
        return review.user.id == user.id;
      }).toList();

      final userReviewList =
          userReviews.isNotEmpty ? userReviews : <ReviewModel>[];
      emit(ReviewFetchSuccess(reviews, userReviewList));
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
      emit(ReviewAddUnselectedFailure(state.reviews, state.userReviews));
      return;
    }
    try {
      final review = ReviewModel(
        id: '',
        user: user,
        specialistId: event.specialistId,
        rating: rating,
        createdAt: DateTime.now(),
        content: event.content,
      );
      emit(ReviewAddLoading(state.reviews, state.userReviews));

      final reviewWithId = await _addReviewUseCase(review);
      final reviews = state.reviews;
      final userReviews = state.userReviews;

      final updatedReviews = [reviewWithId, ...reviews];
      final updatedUserReviews = [reviewWithId, ...userReviews];

      _specialistRatingController.addToSpecialistRatingStream(
        _getUpdatedRating(updatedReviews, event.specialistId),
      );

      emit(ReviewAddSuccess(updatedReviews, updatedUserReviews));
    } catch (error) {
      log('ReviewAddFailure: $error');
      emit(ReviewAddFailure(state.reviews, state.userReviews));
    }
  }

  Future<void> _onUpdateReview(
    ReviewUpdateRequested event,
    Emitter<ReviewState> emit,
  ) async {
    final state = this.state;
    final user = _currentUser;
    if (state is! ReviewFetchSuccess || user == null) return;
    try {
      emit(ReviewAddLoading(state.reviews, state.userReviews));

      final review = event.reviewModel.copyWith(createdAt: DateTime.now());
      await _updateReviewUseCase(review);
      final reviews = state.reviews;
      final userReviews = state.userReviews;

      final updatedReviews = _moveItemToStart(
        review,
        reviews,
        (item) => item.id == review.id,
      );

      final updatedUserReviews = _moveItemToStart(
        review,
        userReviews,
        (item) => item.id == review.id,
      );

      _specialistRatingController.addToSpecialistRatingStream(
        _getUpdatedRating(updatedReviews, event.reviewModel.specialistId),
      );

      emit(ReviewAddSuccess(updatedReviews, updatedUserReviews));
    } catch (error) {
      log('ReviewUpdateFailure: $error');
      emit(ReviewAddFailure(state.reviews, state.userReviews));
    }
  }

  Future<void> _onDeleteReview(
    ReviewDeleteRequested event,
    Emitter<ReviewState> emit,
  ) async {
    final state = this.state;
    final user = _currentUser;
    if (state is! ReviewFetchSuccess || user == null) return;
    try {
      final review = event.reviewModel;
      await _deleteReviewUseCase(review);
      final reviews = state.reviews;
      final userReviews = state.userReviews;

      final updatedReviews = reviews
          .map((deletedReview) {
            if (deletedReview.id == review.id) {
              return null;
            }
            return deletedReview;
          })
          .whereType<ReviewModel>()
          .toList();

      final updatedUserReviews = userReviews
          .map((deletedReview) {
            if (deletedReview.id == review.id) {
              return null;
            }
            return deletedReview;
          })
          .whereType<ReviewModel>()
          .toList();

      _specialistRatingController.addToSpecialistRatingStream(
        _getUpdatedRating(updatedReviews, event.reviewModel.specialistId),
      );

      emit(ReviewDeleteSuccess(updatedReviews, updatedUserReviews));
    } catch (error) {
      log('ReviewDeleteFailure: $error');
      emit(ReviewDeleteFailure(state.reviews, state.userReviews));
    }
  }

  void _onRatingSelect(ReviewRatingSelected event, Emitter<ReviewState> emit) {
    final state = this.state;
    if (state is! ReviewFetchSuccess) return;
    emit(ReviewSelectSuccess(state.reviews, state.userReviews));
  }

  /// Used to move the given [item] to the start of list
  ///
  /// [condition] is needed to find out the [item] in list to be removed
  List<T> _moveItemToStart<T>(
    T item,
    List<T> list,
    bool Function(T) condition,
  ) {
    final index = list.indexWhere(condition);
    if (index == -1) {
      return list;
    }

    list
      ..removeAt(index)
      ..insert(0, item);

    return list;
  }

  SpecialistRating _getUpdatedRating(
    List<ReviewModel> reviewList,
    String specialistId,
  ) {
    final specialistReviews =
        reviewList.where((element) => element.specialistId == specialistId);
    final newRating =
        specialistReviews.map((e) => e.rating).reduce((a, b) => a + b);
    final reviewCount = specialistReviews.length;
    final updatedRating = (
      rating: double.parse((newRating / reviewCount).toStringAsFixed(1)),
      reviewCount: reviewCount,
      specialistId: specialistId,
    );
    return updatedRating;
  }
}
