part of 'notification_settings_cubit.dart';

@immutable
abstract class NotificationSettingsState {}

class NotificationSettingsInitial extends NotificationSettingsState {}

class NotificationSettingsLoading extends NotificationSettingsState {}

class NotificationSettingsGranted extends NotificationSettingsState {}

class NotificationSettingsDenied extends NotificationSettingsState {}
