part of 'audio_message_cubit.dart';

@immutable
abstract class AudioMessageState {}

class AudioMessageInitial extends AudioMessageState {}

class AudioMessageLoading extends AudioMessageState {}

class AudioMessageLoadSuccess extends AudioMessageState {
  AudioMessageLoadSuccess(this.audioPath);

  final String audioPath;
}

class AudioMessageLoadFailure extends AudioMessageState {}
