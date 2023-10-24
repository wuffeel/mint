part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserLoading extends UserState {}

class UserUnauthenticated extends UserState {}

class UserAuthenticated extends UserState {}

class UserLogOutSuccess extends UserState {}

class UserFetchFailure extends UserState {}

class UserFetchSuccess extends UserState {
  UserFetchSuccess(this.user);

  final PatientUser user;
}

class UserLogOutFailure extends UserFetchSuccess {
  UserLogOutFailure(super.user);
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

class UserDataUpdateFailure extends UserFetchSuccess {
  UserDataUpdateFailure(super.user);
}

class UserInitializePresenceSuccess extends UserFetchSuccess {
  UserInitializePresenceSuccess(super.user);
}

class UserInitializePresenceFailure extends UserFetchSuccess {
  UserInitializePresenceFailure(super.user);
}
