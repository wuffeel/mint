import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/entity/user_model.dart';
import 'package:mint/domain/usecase/get_current_user_use_case.dart';
import 'package:mint/domain/usecase/log_out_use_case.dart';

part 'user_event.dart';

part 'user_state.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._getCurrentUserUseCase,
    this._logOutUseCase,
  ) : super(UserLoading()) {
    on<UserDataRequested>(_onUserDataRequested);
    on<UserLogOutRequested>(_onUserLogOut);
  }

  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogOutUseCase _logOutUseCase;

  Future<void> _onUserDataRequested(
    UserDataRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      final user = await _getCurrentUserUseCase();
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
      await _logOutUseCase();
      emit(UserLogOutSuccess());
    } catch (e) {
      emit(UserLogOutFailure());
    }
  }
}
