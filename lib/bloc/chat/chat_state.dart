part of 'chat_bloc.dart';

@immutable
abstract class ChatState {}

class ChatInitial extends ChatState {}

class ChatLoading extends ChatState {}

class ChatInitializeFailure extends ChatState {}

class ChatFetchRoomLoading extends ChatState {}

class ChatFetchRoomSuccess extends ChatState {
  ChatFetchRoomSuccess(this.room);

  final types.Room room;
}

class ChatFetchRoomFailure extends ChatState {}

class ChatFetchMessagesSuccess extends ChatState {
  ChatFetchMessagesSuccess(this.messages, this.roomId);

  final List<types.Message> messages;
  final String roomId;
}

class ChatFetchMessagesFailure extends ChatFetchMessagesSuccess {
  ChatFetchMessagesFailure(super.messages, super.roomId);
}

class ChatSendMessageFailure extends ChatFetchMessagesSuccess {
  ChatSendMessageFailure(super.messages, super.roomId);
}

class ChatDeleteMessageFailure extends ChatFetchMessagesSuccess {
  ChatDeleteMessageFailure(super.messages, super.roomId);
}

class ChatPreviewDataApplyFailure extends ChatFetchMessagesSuccess {
  ChatPreviewDataApplyFailure(super.messages, super.roomId);
}

class ChatFileLoadFailure extends ChatFetchMessagesSuccess {
  ChatFileLoadFailure(super.messages, super.roomId);
}

class ChatSaveAudioFailure extends ChatFetchMessagesSuccess {
  ChatSaveAudioFailure(super.messages, super.roomId);
}
