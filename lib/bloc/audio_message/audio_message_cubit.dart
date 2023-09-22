import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mint_core/mint_module.dart';
import 'package:path/path.dart';

part 'audio_message_state.dart';

@injectable
class AudioMessageCubit extends Cubit<AudioMessageState> {
  AudioMessageCubit(this._loadFileUseCase) : super(AudioMessageInitial());

  final LoadFileUseCase _loadFileUseCase;

  Future<void> loadAudioMessage(
    types.AudioMessage audioMessage,
    PlayerController playerController,
    double playerSize,
  ) async {
    emit(AudioMessageLoading());
    try {
      final audioPath = await _loadFileUseCase(
        audioMessage.name,
        audioMessage.uri,
      );
      if (audioPath == null) return;
      final ext = extension(audioPath);
      // webm file waveform data can not be extracted
      final isWebm = ext == '.webm';
      await playerController.preparePlayer(
        path: audioPath,
        noOfSamples: const PlayerWaveStyle().getSamplesForWidth(playerSize),
        shouldExtractWaveform: !isWebm,
      );
      isWebm ? emit(AudioMessageNoWaveform()) : emit(AudioMessageLoadSuccess());
    } catch (error) {
      log('AudioMessageLoadFailure: $error');
      emit(AudioMessageLoadFailure());
    }
  }
}
