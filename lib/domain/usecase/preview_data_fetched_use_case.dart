import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/chat_service.dart';

@injectable
class PreviewDataFetchedUseCase {
  PreviewDataFetchedUseCase(this._service);

  final ChatService _service;

  Future<void> call(
    TextMessage message,
    PreviewData previewData,
    String roomId,
  ) =>
      _service.onPreviewDataFetched(message, previewData, roomId);
}
