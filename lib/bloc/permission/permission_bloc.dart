import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';

part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(PermissionInitial()) {
    on<PermissionCheckStorageRequested>(_onCheckStorage);
    on<PermissionCheckMicrophoneRequested>(_onCheckMicrophone);
    on<PermissionOpenSettingsRequested>(_onOpenSettings);
  }

  Future<void> _onCheckStorage(
    PermissionCheckStorageRequested event,
    Emitter<PermissionState> emit,
  ) async {
    return _checkPermission(emit, Permission.storage);
  }

  Future<void> _onCheckMicrophone(
    PermissionCheckMicrophoneRequested event,
    Emitter<PermissionState> emit,
  ) async {
    return _checkPermission(emit, Permission.microphone);
  }

  Future<void> _onOpenSettings(
    PermissionOpenSettingsRequested event,
    Emitter<PermissionState> emit,
  ) async {
    if (await openAppSettings()) emit(PermissionOpenSettingsSuccess());
  }

  Future<void> _checkPermission(
    Emitter<PermissionState> emit,
    Permission permission,
  ) async {
    final status = await permission.request();
    log(status.toString());
    if (status.isGranted) {
      emit(PermissionGranted(permission));
    } else if (status.isPermanentlyDenied) {
      emit(PermissionPermanentlyDenied(permission));
    }
  }
}
