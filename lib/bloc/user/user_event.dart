part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserDataListen extends UserEvent {}

class UserLogInCheckRequested extends UserEvent {}

class UserDataRequested extends UserEvent {}

class UserLogOutRequested extends UserEvent {}
