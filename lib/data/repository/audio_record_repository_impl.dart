import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/audio_record_repository.dart';

@Injectable(as: AudioRecordRepository)
class AudioRecordRepositoryImpl implements AudioRecordRepository {
  @override
  RecorderController initializeRecorder() {
    return RecorderController()
      ..updateFrequency = const Duration(milliseconds: 150)
      ..bitRate = 48000;
  }

  @override
  Future<void> startRecord(RecorderController controller) async {
    await controller.record();
  }

  @override
  Future<({String audioPath, Duration duration})?> stopRecord(
    RecorderController controller,
  ) async {
    final audioPath = await controller.stop();
    if (audioPath == null || controller.recordedDuration.inSeconds == 0) {
      return null;
    }
    return (audioPath: audioPath, duration: controller.recordedDuration);
  }
}
