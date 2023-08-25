part of 'permission_bloc.dart';

@immutable
abstract class PermissionState {}

class PermissionInitial extends PermissionState {}

class PermissionGranted extends PermissionState {
  PermissionGranted(this.permission);

  final Permission permission;
}

class PermissionPermanentlyDenied extends PermissionState {
  PermissionPermanentlyDenied(this.permission);

  final Permission permission;
}

class PermissionOpenSettingsSuccess extends PermissionState {}
