import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/controller/user_controller.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';
import 'package:mint/domain/usecase/get_current_user_use_case.dart';
import 'package:mint/domain/usecase/log_out_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._getCurrentUserUseCase,
    this._logOutUseCase,
    this._userController,
  ) : super(UserLoading()) {
    on<UserDataListen>(
      (event, emit) => emit.forEach(
        _userController.user,
        onData: (user) =>
            user != null ? UserFetchSuccess(user) : UserLogOutSuccess(),
      ),
    );
    on<UserLogInCheckRequested>(_onUserLogInCheck);
    on<UserDataRequested>(_onUserDataRequested);
    on<UserLogOutRequested>(_onUserLogOut);
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogOutUseCase _logOutUseCase;

  final UserController _userController;

  Future<void> _onUserLogInCheck(
    UserLogInCheckRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      final user = await _getCurrentUserUseCase();
      _userController.addToUserStream(user);
      user == null
          ? emit(UserUnauthenticated())
          : emit(UserAuthenticated());
    } catch (e) {
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
    } catch (e) {
      emit(UserFetchFailure());
    }
  }

  Future<void> _onUserLogOut(
    UserLogOutRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      await _logOutUseCase();
      _userController.addToUserStream(null);
    } catch (e) {
      emit(UserLogOutFailure());
    }
  }
}
