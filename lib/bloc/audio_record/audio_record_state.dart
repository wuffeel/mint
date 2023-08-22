part of 'audio_record_bloc.dart';

@immutable
abstract class AudioRecordState {}

class AudioRecordInitial extends AudioRecordState {}

class AudioRecordStartSuccess extends AudioRecordState {}

class AudioRecordStartFailure extends AudioRecordState {}

class AudioRecordStopSuccess extends AudioRecordState {
  AudioRecordStopSuccess({this.message});

  final types.PartialAudio? message;
}

class AudioRecordStopFailure extends AudioRecordState {}
