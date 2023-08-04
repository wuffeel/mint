import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/chat_repository.dart';
import 'package:mint/domain/service/abstract/chat_service.dart';
import 'package:mint/domain/service/abstract/storage_service.dart';

@Injectable(as: ChatService)
class FirebaseChatService implements ChatService {
  FirebaseChatService(this._chatRepository, this._storageService);

  final ChatRepository _chatRepository;

  final StorageService _storageService;

  @override
  Future<types.Room> createRoom(String userId, String specialistId) {
    return _chatRepository.createRoom(userId, specialistId);
  }

  @override
  Stream<List<types.Message>> getMessages(types.Room room) {
    return _chatRepository.getMessages(room);
  }

  @override
  Future<void> sendMessage(dynamic partialMessage, String roomId) async {
    if (partialMessage is types.PartialImage) {
      return _handlePartialImageSend(partialMessage, roomId);
    } else if (partialMessage is types.PartialFile) {
      return _handlePartialFileSend(partialMessage, roomId);
    } else if (partialMessage is types.PartialAudio) {
      // TODO(wuffeel): handle audio storing
      throw UnimplementedError();
    } else {
      return _chatRepository.sendMessage(partialMessage, roomId);
    }
  }

  @override
  Future<void> updateMessage(dynamic message, String roomId) {
    return _chatRepository.updateMessage(message, roomId);
  }

  @override
  Future<void> deleteMessage(String roomId, dynamic message) {
    if (message is types.ImageMessage) {
      _storageService.deleteStorageFile(message.uri);
    } else if (message is types.FileMessage) {
      _storageService.deleteStorageFile(message.uri);
    } else if (message is types.AudioMessage) {
      // TODO(wuffeel): handle audio delete from storage
      throw UnimplementedError();
    }
    return _chatRepository.deleteMessage(
      roomId,
      (message as types.Message).id,
    );
  }

  @override
  Future<void> onPreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
    String roomId,
  ) {
    return _chatRepository.onPreviewDataFetched(message, previewData, roomId);
  }

  /// Handles message send and stores the image in FirebaseStorage
  Future<void> _handlePartialImageSend(
    types.PartialImage partialMessage,
    String roomId,
  ) async {
    final filePath = partialMessage.uri;

    // File is stored with uuid as it's name
    final uuid = partialMessage.metadata?['uuid'] as String?;
    final fileId = uuid ?? partialMessage.name;
    final fileUrl =
        await _storageService.uploadChatFile(filePath, fileId, roomId);

    final message = types.PartialImage(
      name: partialMessage.name,
      size: partialMessage.size,
      uri: fileUrl,
      metadata: partialMessage.metadata,
    );

    return _chatRepository.sendMessage(message, roomId);
  }

  /// Handles message send and stores the file in FirebaseStorage
  Future<void> _handlePartialFileSend(
    types.PartialFile partialMessage,
    String roomId,
  ) async {
    final filePath = partialMessage.uri;

    // File is stored with uuid as it's name
    final uuid = partialMessage.metadata?['uuid'] as String?;
    final fileId = uuid ?? partialMessage.name;
    final fileUrl =
        await _storageService.uploadChatFile(filePath, fileId, roomId);

    final message = types.PartialFile(
      name: partialMessage.name,
      size: partialMessage.size,
      uri: fileUrl,
      metadata: partialMessage.metadata,
    );

    return _chatRepository.sendMessage(message, roomId);
  }
}
