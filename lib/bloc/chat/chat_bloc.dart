import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint/domain/service/abstract/chat_service.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';
import 'package:mint/utils/file_utils.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';

part 'chat_event.dart';

part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._chatService,
    this._filePickerService,
    this._userController,
  ) : super(ChatInitial()) {
    _subscribeToUserChange();
    on<ChatInitializeRequested>(
      (event, emit) {
        emit(ChatLoading());
        return emit.forEach(
          _chatService.getMessages(event.room),
          onData: (messages) =>
              ChatFetchMessagesSuccess(messages, event.room.id),
          onError: (error, _) {
            final state = this.state;
            if (state is! ChatFetchMessagesSuccess) {
              log('ChatInitializeFailure: $error');
              return ChatInitializeFailure();
            } else {
              log('ChatFetchMessagesFailure: $error');
              return ChatFetchMessagesFailure(state.messages, event.room.id);
            }
          },
        );
      },
    );
    on<ChatFetchRoomRequested>(_onRoomFetch);
    on<ChatSendMessageRequested>(_onSendMessage);
    on<ChatUpdateMessageRequested>(_onUpdateMessage);
    on<ChatDeleteMessageRequested>(_onDeleteMessage);
    on<ChatPreviewDataFetched>(_onPreviewDataFetched);
    on<ChatFilePickRequested>(_onFilePick);
    on<ChatImagePickRequested>(_onImagePick);
    on<ChatFileLoadRequested>(_onFileLoad);
  }

  final ChatService _chatService;
  final FilePickerService _filePickerService;

  UserModel? _currentUser;
  final UserController _userController;
  late final StreamSubscription<UserModel?> _userSubscription;

  void _subscribeToUserChange() {
    _userSubscription = _userController.user.listen((user) {
      _currentUser = user;
    });
  }

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  Future<void> _onRoomFetch(
    ChatFetchRoomRequested event,
    Emitter<ChatState> emit,
  ) async {
    final user = _currentUser;
    if (user == null) return;

    try {
      emit(ChatFetchRoomLoading());
      final room = await _chatService.createRoom(user.id, event.specialistId);
      emit(ChatFetchRoomSuccess(room));
    } catch (error) {
      log('ChatFetchRoomFailure: $error');
      emit(ChatFetchRoomFailure());
    }
  }

  Future<void> _onSendMessage(
    ChatSendMessageRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;

    try {
      await _chatService.sendMessage(event.message, state.roomId);
    } catch (error) {
      log('ChatSendMessageFailure: $error');
      emit(ChatSendMessageFailure(state.messages, state.roomId));
    }
  }

  Future<void> _onUpdateMessage(
    ChatUpdateMessageRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;

    try {
      await _chatService.updateMessage(event.message, state.roomId);
    } catch (error) {
      log('ChatUpdateMessageFailure: $error');
      emit(ChatUpdateMessageFailure(state.messages, state.roomId));
    }
  }

  Future<void> _onDeleteMessage(
    ChatDeleteMessageRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;

    try {
      await _chatService.deleteMessage(state.roomId, event.message);
    } catch (error) {
      log('ChatDeleteMessageFailure: $error');
      emit(ChatDeleteMessageFailure(state.messages, state.roomId));
    }
  }

  Future<void> _onPreviewDataFetched(
    ChatPreviewDataFetched event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;

    try {
      await _chatService.onPreviewDataFetched(
        event.message,
        event.previewData,
        state.roomId,
      );
    } catch (error) {
      log('ChatPreviewDataApplyFailure: $error');
      emit(ChatPreviewDataApplyFailure(state.messages, state.roomId));
    }
  }

  Future<void> _onImagePick(
    ChatImagePickRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final message = await _filePickerService.pickImage();

      if (message != null) add(ChatSendMessageRequested(message));
    } catch (error) {
      log('ChatImagePickFailure: $error');
    }
  }

  Future<void> _onFilePick(
    ChatFilePickRequested event,
    Emitter<ChatState> emit,
  ) async {
    try {
      final message = await _filePickerService.pickFile();

      if (message != null) add(ChatSendMessageRequested(message));
    } catch (error) {
      log('ChatFilePickFailure: $error');
    }
  }

  Future<void> _onFileLoad(
    ChatFileLoadRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;
    final messageList = state.messages;
    final message = event.message;

    try {
      final uuid = message.metadata?['uuid'] as String?;
      final messagePath = uuid ?? message.name;
      final fileExtension = FileUtils.getFileExtensionByPath(message.name);

      await _filePickerService.loadFile(
        messagePath,
        message.uri,
        fileExtension,
        onLoadingCallback: () {
          final loadingMessageList = messageList.map((element) {
            return element.id != message.id
                ? element
                : (element as types.FileMessage).copyWith(isLoading: true);
          }).toList();
          emit(ChatFetchMessagesSuccess(loadingMessageList, state.roomId));
        },
        onLoadedCallback: () {
          final loadedMessageList = messageList.map((element) {
            return element.id != message.id
                ? element
                : (element as types.FileMessage).copyWith(isLoading: false);
          }).toList();
          emit(ChatFetchMessagesSuccess(loadedMessageList, state.roomId));
        },
      );
      await _filePickerService.openFile(messagePath, fileExtension);
    } catch (error) {
      log('ChatFileLoadFailure: $error');
      emit(ChatFileLoadFailure(messageList, state.roomId));
    }
  }
}
