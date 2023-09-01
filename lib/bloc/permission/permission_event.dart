part of 'permission_bloc.dart';

@immutable
abstract class PermissionEvent {}

class PermissionCheckStorageRequested extends PermissionEvent {}

class PermissionCheckMicrophoneRequested extends PermissionEvent {}

class PermissionOpenSettingsRequested extends PermissionEvent {}
