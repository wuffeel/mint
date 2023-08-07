import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';

@injectable
class SaveAudioUseCase {
  SaveAudioUseCase(this._service);

  final FilePickerService _service;

  Future<PartialAudio> call(PartialAudio audioMessage) =>
      _service.saveAudio(audioMessage);
}
