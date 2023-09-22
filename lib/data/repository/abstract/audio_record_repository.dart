import 'package:audio_waveforms/audio_waveforms.dart';

abstract class AudioRecordRepository {
  RecorderController initializeRecorder();

  Future<void> startRecord(RecorderController controller);

  Future<({String audioPath, Duration duration})?> stopRecord(
    RecorderController controller,
  );
}
