import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_service.dart';

@injectable
class SaveAudioUseCase {
  SaveAudioUseCase(this._service);

  final FileService _service;

  Future<PartialAudio> call(PartialAudio audioMessage) =>
      _service.saveAudio(audioMessage);
}
