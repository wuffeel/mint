import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/audio_record_service.dart';

@injectable
class StartAudioRecordUseCase {
  StartAudioRecordUseCase(this._service);

  final AudioRecordService _service;

  Future<void> call(RecorderController controller) =>
      _service.startRecord(controller);
}
