import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/audio_record_service.dart';

@injectable
class InitializeAudioRecorderUseCase {
  InitializeAudioRecorderUseCase(this._service);

  final AudioRecordService _service;

  RecorderController call() => _service.initializeRecorder();
}
