import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/controller/user_controller.dart';
import '../../domain/entity/user_model/user_model.dart';
import '../../domain/usecase/create_chat_room_use_case.dart';
import '../../domain/usecase/delete_message_use_case.dart';
import '../../domain/usecase/get_messages_use_case.dart';
import '../../domain/usecase/load_file_use_case.dart';
import '../../domain/usecase/open_file_use_case.dart';
import '../../domain/usecase/pick_file_use_case.dart';
import '../../domain/usecase/pick_image_use_case.dart';
import '../../domain/usecase/preview_data_fetched_use_case.dart';
import '../../domain/usecase/save_audio_use_case.dart';
import '../../domain/usecase/send_message_use_case.dart';

part 'chat_event.dart';

part 'chat_state.dart';

@injectable
class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc(
    this._userController,
    this._getMessagesUseCase,
    this._createChatRoomUseCase,
    this._sendMessageUseCase,
    this._deleteMessageUseCase,
    this._previewDataFetchedUseCase,
    this._pickImageUseCase,
    this._pickFileUseCase,
    this._loadFileUseCase,
    this._openFileUseCase,
    this._saveAudioUseCase,
  ) : super(ChatInitial()) {
    _subscribeToUserChange();
    on<ChatInitializeRequested>(
      (event, emit) {
        emit(ChatLoading());
        return emit.forEach(
          _getMessagesUseCase(event.room),
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
    on<ChatDeleteMessageRequested>(_onDeleteMessage);
    on<ChatPreviewDataFetched>(_onPreviewDataFetched);
    on<ChatFilePickRequested>(_onFilePick);
    on<ChatImagePickRequested>(_onImagePick);
    on<ChatFileLoadRequested>(_onFileLoad);
    on<ChatSaveAudioRequested>(_onSaveAudio);
  }

  final GetMessagesUseCase _getMessagesUseCase;
  final CreateChatRoomUseCase _createChatRoomUseCase;
  final SendMessageUseCase _sendMessageUseCase;
  final DeleteMessageUseCase _deleteMessageUseCase;
  final PreviewDataFetchedUseCase _previewDataFetchedUseCase;
  final PickImageUseCase _pickImageUseCase;
  final PickFileUseCase _pickFileUseCase;
  final LoadFileUseCase _loadFileUseCase;
  final OpenFileUseCase _openFileUseCase;
  final SaveAudioUseCase _saveAudioUseCase;

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
      final room = await _createChatRoomUseCase(user.id, event.specialistId);
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
      await _sendMessageUseCase(event.message, state.roomId);
    } catch (error) {
      log('ChatSendMessageFailure: $error');
      emit(ChatSendMessageFailure(state.messages, state.roomId));
    }
  }

  Future<void> _onDeleteMessage(
    ChatDeleteMessageRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;

    try {
      await _deleteMessageUseCase(state.roomId, event.message);
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
      await _previewDataFetchedUseCase(
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
      final message = await _pickImageUseCase();

      if (message != null) add(ChatSendMessageRequested(message));
    } catch (error) {
      log('ChatImagePickFailure: $error');
    }
  }

  Future<void> _onFilePick(
    ChatFilePickRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;

    try {
      final message = await _pickFileUseCase();

      if (message != null) add(ChatSendMessageRequested(message));
    } catch (error) {
      log('ChatFilePickFailure: $error');
      if (error.toString().contains('read_external_storage_denied')) {
        emit(ChatFilePickPermissionDenied(state.messages, state.roomId));
      }
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
      final messageName = message is types.FileMessage
          ? message.name
          : message is types.AudioMessage
              ? message.name
              : null;

      final messageUri = message is types.FileMessage
          ? message.uri
          : message is types.AudioMessage
              ? message.uri
              : null;
      if (messageName == null || messageUri == null) return;
      final messagePath = uuid ?? messageName;

      await _loadFileUseCase(
        messagePath,
        messageUri,
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
      if (event.shouldOpen) await _openFileUseCase(messagePath);
    } catch (error) {
      log('ChatFileLoadFailure: $error');
      emit(ChatFileLoadFailure(messageList, state.roomId));
    }
  }

  Future<void> _onSaveAudio(
    ChatSaveAudioRequested event,
    Emitter<ChatState> emit,
  ) async {
    final state = this.state;
    if (state is! ChatFetchMessagesSuccess) return;
    try {
      final message = await _saveAudioUseCase(event.audioMessage);
      add(ChatSendMessageRequested(message));
    } catch (error) {
      log('ChatSaveAudioFailure: $error');
      emit(ChatSaveAudioFailure(state.messages, state.roomId));
    }
  }
}
