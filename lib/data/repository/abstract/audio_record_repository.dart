import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class AudioRecordRepository {
  Future<void> startRecord(RecorderController controller);

  Future<types.PartialAudio?> stopRecord(RecorderController controller);
}
