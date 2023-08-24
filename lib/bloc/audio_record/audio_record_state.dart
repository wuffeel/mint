part of 'audio_record_bloc.dart';

@immutable
abstract class AudioRecordState {}

class AudioRecordInitial extends AudioRecordState {}

class AudioRecordInitializeSuccess extends AudioRecordState {
  AudioRecordInitializeSuccess(this.controller);

  final RecorderController controller;
}

class AudioRecordStartSuccess extends AudioRecordInitializeSuccess {
  AudioRecordStartSuccess(super.controller);
}

class AudioRecordStartFailure extends AudioRecordInitializeSuccess {
  AudioRecordStartFailure(super.controller);
}

class AudioRecordStopSuccess extends AudioRecordInitializeSuccess {
  AudioRecordStopSuccess(super.controller, {this.message});

  final types.PartialAudio? message;
}

class AudioRecordStopFailure extends AudioRecordInitializeSuccess {
  AudioRecordStopFailure(super.controller);
}
