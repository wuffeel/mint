import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/user_controller.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';
import 'package:mint/domain/usecase/get_current_user_use_case.dart';
import 'package:mint/domain/usecase/log_out_use_case.dart';
import 'package:mint/domain/usecase/user_data_update_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._getCurrentUserUseCase,
    this._logOutUseCase,
    this._userDataUpdateUseCase,
    this._userController,
  ) : super(UserLoading()) {
    on<UserDataListen>(
      (event, emit) => emit.forEach(
        _userController.user,
        onData: (user) =>
            user != null ? UserFetchSuccess(user) : UserLogOutSuccess(),
        onError: (error, _) {
          log('UserFailure: $error');
          return UserFetchFailure();
        },
      ),
    );
    on<UserLogInCheckRequested>(_onUserLogInCheck);
    on<UserDataRequested>(_onUserDataRequested);
    on<UserDataUpdateRequested>(_onUserDataUpdate);
    on<UserLogOutRequested>(_onUserLogOut);
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogOutUseCase _logOutUseCase;
  final UserDataUpdateUseCase _userDataUpdateUseCase;

  final UserController _userController;

  Future<void> _onUserLogInCheck(
    UserLogInCheckRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      final user = await _getCurrentUserUseCase();
      _userController.addToUserStream(user);
      user == null ? emit(UserUnauthenticated()) : emit(UserAuthenticated());
    } catch (error) {
      log('UserFetchFailure: $error');
      emit(UserFetchFailure());
    }
  }

  Future<void> _onUserDataRequested(
    UserDataRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      final user = await _getCurrentUserUseCase();
      _userController.addToUserStream(user);
    } catch (error) {
      log('UserFetchFailure: $error');
      emit(UserFetchFailure());
    }
  }

  Future<void> _onUserDataUpdate(
    UserDataUpdateRequested event,
    Emitter<UserState> emit,
  ) async {
    final state = this.state;
    if (state is! UserFetchSuccess) return;

    try {
      emit(UserDataUpdateLoading(state.user));
      final userData = state.user.copyWith(
        firstName: event.firstName,
        lastName: event.lastName,
        dateOfBirth: event.dateOfBirth,
        photoUrl: event.photoPath,
      );
      final updatedUser = await _userDataUpdateUseCase(userData);
      emit(UserDataUpdateSuccess(updatedUser));
    } catch (error) {
      log('UserDataUpdateFailure: $error');
      emit(UserDataUpdateFailure());
    }
  }

  Future<void> _onUserLogOut(
    UserLogOutRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      await _logOutUseCase();
      _userController.addToUserStream(null);
    } catch (error) {
      log('UserLogOutFailure: $error');
      emit(UserLogOutFailure());
    }
  }
}
