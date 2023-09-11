import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/chat_service.dart';

@injectable
class GetMessagesUseCase {
  GetMessagesUseCase(this._service);

  final ChatService _service;

  Future<Stream<List<Message>>> call(Room room) => _service.getMessages(room);
}
