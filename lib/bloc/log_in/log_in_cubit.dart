import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/usecase/get_current_user_use_case.dart';

part 'log_in_state.dart';

@injectable
class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._getCurrentUserUseCase) : super(LogInInitial());

  final GetCurrentUserUseCase _getCurrentUserUseCase;

  Future<void> checkLogIn() async {
    emit (LogInLoading());
    final user = await _getCurrentUserUseCase();
    user == null ? emit(LogInUnauthenticated()) : emit(LogInAuthenticated());
  }
}
