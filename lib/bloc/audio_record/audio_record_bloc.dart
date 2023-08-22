import 'dart:async';
import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/start_audio_record_use_case.dart';
import '../../domain/usecase/stop_audio_record_use_case.dart';

part 'audio_record_event.dart';

part 'audio_record_state.dart';

@injectable
class AudioRecordBloc extends Bloc<AudioRecordEvent, AudioRecordState> {
  AudioRecordBloc(
    this._startAudioRecordUseCase,
    this._stopAudioRecordUseCase,
  ) : super(AudioRecordInitial()) {
    on<AudioRecordStartRequested>(_onStartRecord);
    on<AudioRecordStopRequested>(_onStopRecord);
  }

  final StartAudioRecordUseCase _startAudioRecordUseCase;
  final StopAudioRecordUseCase _stopAudioRecordUseCase;

  Future<void> _onStartRecord(
    AudioRecordStartRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    try {
      await _startAudioRecordUseCase(event.controller);
      emit(AudioRecordStartSuccess());
    } catch (error) {
      log('AudioRecordStartFailure: $error');
      emit(AudioRecordStartFailure());
    }
  }

  /// Stops recording and saves audio file.
  Future<void> _onStopRecord(
    AudioRecordStopRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    try {
      final audioMessage = await _stopAudioRecordUseCase(event.controller);
      if (audioMessage != null) {
        emit(AudioRecordStopSuccess(message: audioMessage));
        return;
      }
      emit(AudioRecordStopSuccess());
    } catch (error) {
      log('AudioRecordStopFailure: $error');
      emit(AudioRecordStopFailure());
    }
  }
}
