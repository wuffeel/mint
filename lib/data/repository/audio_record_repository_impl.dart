import 'dart:developer';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
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
  Future<types.PartialAudio?> stopRecord(RecorderController controller) async {
    final audioPath = await controller.stop();
    log(audioPath.toString());
    if (audioPath != null) {
      final file = File(audioPath);
      return types.PartialAudio(
        duration: controller.recordedDuration,
        name: file.path.split(Platform.pathSeparator).last,
        size: file.lengthSync(),
        uri: file.uri.toString(),
      );
    }

    return null;
  }
}
