import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:permission_handler/permission_handler.dart';

part 'notification_settings_state.dart';

class NotificationSettingsCubit extends Cubit<NotificationSettingsState> {
  NotificationSettingsCubit() : super(NotificationSettingsInitial());

  Future<void> checkNotificationSettings() async {
    emit(NotificationSettingsLoading());
    final status = await Permission.notification.status;
    if (status.isGranted) {
      emit(NotificationSettingsGranted());
      return;
    }
    emit(NotificationSettingsDenied());
  }

  Future<void> openNotificationSettings() async {
    await openAppSettings();
  }
}
