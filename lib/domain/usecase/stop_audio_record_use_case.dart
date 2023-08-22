import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/audio_record_service.dart';

@injectable
class StopAudioRecordUseCase {
  StopAudioRecordUseCase(this._service);

  final AudioRecordService _service;

  Future<PartialAudio?> call(RecorderController controller) =>
      _service.stopRecord(controller);
}
