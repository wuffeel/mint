import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/audio_record_service.dart';

import '../../data/repository/abstract/audio_record_repository.dart';

@Injectable(as: AudioRecordService)
class AudioRecordServiceImpl implements AudioRecordService {
  AudioRecordServiceImpl(this._audioRecordRepository);

  final AudioRecordRepository _audioRecordRepository;

  @override
  RecorderController initializeRecorder() {
    return _audioRecordRepository.initializeRecorder();
  }

  @override
  Future<void> startRecord(RecorderController controller) {
    return _audioRecordRepository.startRecord(controller);
  }

  @override
  Future<({String audioPath, Duration duration})?> stopRecord(
    RecorderController controller,
  ) {
    return _audioRecordRepository.stopRecord(controller);
  }
}
