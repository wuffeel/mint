part of 'notifications_bloc.dart';

@immutable
abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}

class NotificationsInitializeLoading extends NotificationsState {}

class NotificationsInitializeSuccess extends NotificationsState {}

class NotificationsInitializeFailure extends NotificationsState {}

class NotificationsFetchChatRoomSuccess extends NotificationsState {
  NotificationsFetchChatRoomSuccess(this.chatRoom, this.patientId);

  final types.Room chatRoom;
  final String patientId;
}

class NotificationsFetchChatRoomFailure extends NotificationsState {}

class NotificationsFetchSessionDataSuccess extends NotificationsState {
  NotificationsFetchSessionDataSuccess(this.bookingData);

  final BookingData bookingData;
}

class NotificationsFetchSessionDataFailure extends NotificationsState {}
