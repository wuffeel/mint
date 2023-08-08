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

class ChatUpdateMessageRequested extends ChatEvent {
  ChatUpdateMessageRequested(this.message);

  final types.Message message;
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
  ChatFileLoadRequested(this.message);

  final types.FileMessage message;
}

class ChatImagePickRequested extends ChatEvent {}

class ChatFilePickRequested extends ChatEvent {}
