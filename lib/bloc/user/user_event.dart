part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserDataRequested extends UserEvent {}

class UserLogOutRequested extends UserEvent {}
