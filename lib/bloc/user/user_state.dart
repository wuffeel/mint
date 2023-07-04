part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {}

class UserFetchSuccess extends UserState {
  UserFetchSuccess(this.user);

  final UserModel user;
}

class UserFetchFailure extends UserState {}

class UserLogOutSuccess extends UserState {}

class UserLogOutFailure extends UserState {}
