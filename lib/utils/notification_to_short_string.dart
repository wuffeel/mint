import '../backbone/notification_type.dart';

/// Extension with one [toShortString] method.
extension NotificationToShortString on NotificationType {
  /// Converts enum to the string equal to enum's name.
  String toShortString() => toString().split('.').last;
}
