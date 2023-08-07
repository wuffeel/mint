import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/chat_service.dart';

@injectable
class CreateChatRoomUseCase {
  CreateChatRoomUseCase(this._service);

  final ChatService _service;

  Future<Room> call(String userId, String specialistId) =>
      _service.createRoom(userId, specialistId);
}
