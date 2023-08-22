import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/audio_record_service.dart';

import '../../data/repository/abstract/audio_record_repository.dart';

@Injectable(as: AudioRecordService)
class AudioRecordServiceImpl implements AudioRecordService {
  AudioRecordServiceImpl(this._audioRecordRepository);

  final AudioRecordRepository _audioRecordRepository;

  @override
  Future<void> startRecord(RecorderController controller) {
    return _audioRecordRepository.startRecord(controller);
  }

  @override
  Future<types.PartialAudio?> stopRecord(RecorderController controller) {
    return _audioRecordRepository.stopRecord(controller);
  }
}
