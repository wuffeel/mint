abstract class NotificationRepository {
  Stream<String> get onChatRoomId;

  Stream<String> get onBookingId;

  Future<void> initializeNotifications(String userId);

  Future<void> closeSubscriptions();
}
