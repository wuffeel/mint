import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

part 'log_in_state.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._userService) : super(LogInInitial());

  final UserService _userService;

  Future<void> checkLogIn() async {
    emit (LogInLoading());
    final user = await _userService.getCurrentUser();
    user == null ? emit(LogInUnauthenticated()) : emit(LogInAuthenticated());
  }
}
