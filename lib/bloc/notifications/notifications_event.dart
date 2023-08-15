part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsEvent {}

class NotificationsInitializeRequested extends NotificationsEvent {}

class NotificationsChatRoomRequested extends NotificationsEvent {
  NotificationsChatRoomRequested(this.roomId);

  final String roomId;
}

class NotificationsSessionDataRequested extends NotificationsEvent {
  NotificationsSessionDataRequested(this.bookingId);

  final String bookingId;
}
