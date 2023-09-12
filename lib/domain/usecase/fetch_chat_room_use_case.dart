import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_module.dart';

@injectable
class FetchChatRoomUseCase {
  FetchChatRoomUseCase(this._service);

  final ChatService _service;

  Future<Room?> call(String roomId) => _service.fetchRoom(roomId);
}
