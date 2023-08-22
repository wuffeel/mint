part of 'audio_record_bloc.dart';

@immutable
abstract class AudioRecordEvent {}

class AudioRecordStartRequested extends AudioRecordEvent {
  AudioRecordStartRequested(this.controller);

  final RecorderController controller;
}

class AudioRecordStopRequested extends AudioRecordEvent {
  AudioRecordStopRequested(this.controller);

  final RecorderController controller;
}
