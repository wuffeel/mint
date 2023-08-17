part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class UserDataListen extends UserEvent {}

class UserLogInCheckRequested extends UserEvent {}

class UserDataRequested extends UserEvent {}

class UserDataUpdateRequested extends UserEvent {
  UserDataUpdateRequested({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.photoPath,
  });

  final String firstName;
  final String lastName;
  final DateTime? dateOfBirth;
  final String? photoPath;
}

class UserPickPhotoRequested extends UserEvent {}

class UserLogOutRequested extends UserEvent {}
