import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/load_file_use_case.dart';

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
      final uuid =
          audioMessage.metadata?['uuid'] as String? ?? audioMessage.name;
      final audioPath = await _loadFileUseCase(uuid, audioMessage.uri);
      await playerController.preparePlayer(
        path: audioPath,
        noOfSamples: const PlayerWaveStyle().getSamplesForWidth(playerSize),
      );
      emit(AudioMessageLoadSuccess(audioPath));
    } catch (error) {
      log('AudioMessageLoadFailure: $error');
      emit(AudioMessageLoadFailure());
    }
  }
}
