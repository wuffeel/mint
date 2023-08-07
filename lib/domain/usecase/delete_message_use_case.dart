import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/chat_service.dart';

@injectable
class DeleteMessageUseCase {
  DeleteMessageUseCase(this._service);

  final ChatService _service;

  Future<void> call(String roomId, Message message) =>
      _service.deleteMessage(roomId, message);
}
