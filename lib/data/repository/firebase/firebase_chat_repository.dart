import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/chat_repository.dart';

import '../../../assembly/factory.dart';

@Injectable(as: ChatRepository)
class FirebaseChatRepository implements ChatRepository {
  FirebaseChatRepository(this._chatUserFromMap);

  final _chatCoreInstance = FirebaseChatCore.instance;
  final _firestoreInstance = FirebaseFirestore.instance;

  static const _roomCollection = 'chat_rooms';
  static const _chatUsersCollection = 'chat_users';

  final Factory<types.User, Map<String, dynamic>> _chatUserFromMap;

  CollectionReference get _roomCollectionRef =>
      _firestoreInstance.collection(_roomCollection);

  CollectionReference get _chatUsersCollectionRef =>
      _firestoreInstance.collection(_chatUsersCollection);

  @override
  Future<types.Room> createRoom(String userId, String specialistId) async {
    final specialist = await _chatUsersCollectionRef.doc(specialistId).get();
    final data = specialist.data() as Map<String, dynamic>?;

    if (data == null) {
      return const types.Room(id: '', type: types.RoomType.direct, users: []);
    }

    data['id'] = specialist.id;
    final user = _chatUserFromMap.create(data);
    return _chatCoreInstance.createRoom(user);
  }

  @override
  Future<Map<String, dynamic>?> fetchRoom(String roomId) async {
    final roomSnap = await _roomCollectionRef.doc(roomId).get();
    final data = roomSnap.data() as Map<String, dynamic>?;
    if (data == null) return null;

    final userIds = List<String>.from(data['userIds'] as List<dynamic>);

    final users = await _getUsersFromIds(userIds);

    data['id'] = roomSnap.id;
    data['users'] = users;

    return data;
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
  Future<void> deleteMessage(String roomId, String messageId) async {
    return _chatCoreInstance.deleteMessage(roomId, messageId);
  }

  @override
  Future<void> onPreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
    String roomId,
  ) async {
    return _chatCoreInstance.updateMessage(
      message.copyWith(previewData: previewData),
      roomId,
    );
  }

  // Used here instead of factory to prevent circular dependency.
  // The problem: ChatUserFromMap needs to use List<Users>, which are
  // fetched with ChatService. ChatService dependent on ChatUserFromMap to
  // transform Map data to types.Room, and ChatUserFromMap is dependent on
  // ChatService to retrieve users info => injector throws Stack Overflow.
  Future<List<types.User>> _getUsersFromIds(List<String> userIds) async {
    final userFutures = userIds.map((userId) async {
      final userSnap = await _chatUsersCollectionRef.doc(userId).get();
      final data = userSnap.data() as Map<String, dynamic>?;
      if (data == null) return null;
      data['id'] = userSnap.id;
      return _chatUserFromMap.create(data);
    });
    return (await Future.wait(userFutures)).whereType<types.User>().toList();
  }
}
