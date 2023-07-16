import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
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
    this._userController,
  ) : super(ReviewInitial()) {
    _subscribeToUserChange();
    on<ReviewFetchRequested>(_onReviewFetch);
  }

  final FetchSpecialistReviewsUseCase _fetchSpecialistReviewsUseCase;

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
}
