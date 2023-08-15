import 'dart:async';

import 'package:injectable/injectable.dart';

@lazySingleton
class NotificationController {
  final _chatController = StreamController<String>.broadcast();
  final _sessionController = StreamController<String>.broadcast();

  /// Returns a Stream that is called when user taps on notification related to
  /// chat.
  ///
  /// The Stream contains roomId.
  Stream<String> get onChatRoom => _chatController.stream;

  /// Returns a Stream that is called when user taps on notification related to
  /// consultation booked that is about to start.
  ///
  /// The Stream contains bookingId.
  Stream<String> get onSessionData => _sessionController.stream;

  void addToChatStream(String roomId) => _chatController.add(roomId);

  void addToSessionStream(String bookingId) =>
      _sessionController.add(bookingId);
}
