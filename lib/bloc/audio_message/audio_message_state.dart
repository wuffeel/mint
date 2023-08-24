part of 'audio_message_cubit.dart';

@immutable
abstract class AudioMessageState {}

class AudioMessageInitial extends AudioMessageState {}

class AudioMessageLoading extends AudioMessageState {}

class AudioMessageLoadSuccess extends AudioMessageState {}

class AudioMessageLoadFailure extends AudioMessageState {}
