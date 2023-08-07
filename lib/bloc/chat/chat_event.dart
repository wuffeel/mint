part of 'chat_bloc.dart';

@immutable
abstract class ChatEvent {}

class ChatFetchRoomRequested extends ChatEvent {
  ChatFetchRoomRequested(this.specialistId);

  final String specialistId;
}

class ChatInitializeRequested extends ChatEvent {
  ChatInitializeRequested(this.room);

  final types.Room room;
}

class ChatSendMessageRequested extends ChatEvent {
  ChatSendMessageRequested(this.message);

  final dynamic message;
}

class ChatDeleteMessageRequested extends ChatEvent {
  ChatDeleteMessageRequested(this.message);

  final types.Message message;
}

class ChatPreviewDataFetched extends ChatEvent {
  ChatPreviewDataFetched(this.message, this.previewData);

  final types.TextMessage message;
  final types.PreviewData previewData;
}

class ChatFileLoadRequested extends ChatEvent {
  ChatFileLoadRequested(this.message, {required this.shouldOpen});

  final types.Message message;

  /// Variable to specify if the file should be opened after load
  final bool shouldOpen;
}

class ChatImagePickRequested extends ChatEvent {}

class ChatFilePickRequested extends ChatEvent {}

class ChatSaveAudioRequested extends ChatEvent {
  ChatSaveAudioRequested(this.audioMessage);

  final types.PartialAudio audioMessage;
}
