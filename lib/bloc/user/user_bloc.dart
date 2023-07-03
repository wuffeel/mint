import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/user_model.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this._userService) : super(UserLoading()) {
    on<UserDataRequested>(_onUserDataRequested);
    on<UserLogOutRequested>(_onUserLogOut);
  }

  final UserService _userService;

  Future<void> _onUserDataRequested(
    UserDataRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      final user = await _userService.getCurrentUser();
      if (user == null) return;
      emit(UserDataFetchSuccess(user));
    } catch (e) {
      emit(UserDataFetchFailure());
    }
  }

  Future<void> _onUserLogOut(
      UserLogOutRequested event,
      Emitter<UserState> emit,
      ) async {
    try {
      await _userService.logOut();
      emit(UserLogOutSuccess());
    } catch (e) {
      emit(UserLogOutFailure());
    }
  }
}
