import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/chat_repository.dart';

@Injectable(as: ChatRepository)
class FirebaseChatRepository implements ChatRepository {
  final _chatCoreInstance = FirebaseChatCore.instance;

  @override
  Future<types.Room> createRoom(String userId, String specialistId) async {
    final specialist = await FirebaseFirestore.instance
        .collection('chat_users')
        .doc(specialistId)
        .get();
    final data = specialist.data();
    if (data == null) {
      return const types.Room(id: '', type: types.RoomType.direct, users: []);
    }
    data['createdAt'] = (data['createdAt'] as Timestamp).millisecondsSinceEpoch;
    data['id'] = specialist.id;
    data['lastSeen'] = (data['lastSeen'] as Timestamp).millisecondsSinceEpoch;
    data['updatedAt'] = (data['updatedAt'] as Timestamp).millisecondsSinceEpoch;
    final user = types.User.fromJson(data);
    return _chatCoreInstance.createRoom(user);
  }

  @override
  Stream<List<types.Message>> getMessages(types.Room room) {
    return _chatCoreInstance.messages(room);
  }

  @override
  Future<void> sendMessage(dynamic partialMessage, String roomId) async {
    return _chatCoreInstance.sendMessage(partialMessage, roomId);
  }

  @override
  Future<void> updateMessage(dynamic message, String roomId) async {
    return _chatCoreInstance.updateMessage(message as types.Message, roomId);
  }

  @override
  Future<void> deleteMessage(String roomId, String messageId) async {
    return _chatCoreInstance.deleteMessage(roomId, messageId);
  }

  @override
  Future<void> onPreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
    String roomId,
  ) async {
    return _chatCoreInstance.updateMessage(message, roomId);
  }
}
