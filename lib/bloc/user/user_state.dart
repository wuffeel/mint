part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {}

class UserLogOutSuccess extends UserState {}

class UserLogOutFailure extends UserState {}

class UserDataUpdateFailure extends UserState {}

class UserFetchFailure extends UserState {}

class UserFetchSuccess extends UserState {
  UserFetchSuccess(this.user);

  final UserModel user;
}

class UserDateUnselectedFailure extends UserFetchSuccess {
  UserDateUnselectedFailure(super.user);
}

class UserDataUpdateLoading extends UserFetchSuccess {
  UserDataUpdateLoading(super.user);
}

class UserDataUpdateSuccess extends UserFetchSuccess {
  UserDataUpdateSuccess(super.user);
}
