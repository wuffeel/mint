part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserDataFetchSuccess extends UserState {
  UserDataFetchSuccess(this.user);

  final UserModel user;
}

class UserDataFetchFailure extends UserState {}

class UserLogOutSuccess extends UserState {}

class UserLogOutFailure extends UserState {}
