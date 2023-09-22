import 'dart:async';
import 'dart:developer';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/usecase/initialize_audio_recorder_use_case.dart';
import '../../domain/usecase/start_audio_record_use_case.dart';
import '../../domain/usecase/stop_audio_record_use_case.dart';

part 'audio_record_event.dart';

part 'audio_record_state.dart';

@injectable
class AudioRecordBloc extends Bloc<AudioRecordEvent, AudioRecordState> {
  AudioRecordBloc(
    this._initializeAudioRecorderUseCase,
    this._startAudioRecordUseCase,
    this._stopAudioRecordUseCase,
  ) : super(AudioRecordInitial()) {
    on<AudioRecordInitializeRequested>(_onRecorderInitialize);
    on<AudioRecordStartRequested>(_onStartRecord);
    on<AudioRecordStopRequested>(_onStopRecord);
  }

  final InitializeAudioRecorderUseCase _initializeAudioRecorderUseCase;
  final StartAudioRecordUseCase _startAudioRecordUseCase;
  final StopAudioRecordUseCase _stopAudioRecordUseCase;

  @override
  Future<void> close() async {
    final state = this.state;
    if (state is AudioRecordInitializeSuccess) {
      state.controller.dispose();
    }
    return super.close();
  }

  void _onRecorderInitialize(
    AudioRecordInitializeRequested event,
    Emitter<AudioRecordState> emit,
  ) {
    final controller = _initializeAudioRecorderUseCase();
    emit(AudioRecordInitializeSuccess(controller));
  }

  Future<void> _onStartRecord(
    AudioRecordStartRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    final state = this.state;
    if (state is! AudioRecordInitializeSuccess) return;
    try {
      await _startAudioRecordUseCase(state.controller);
      emit(AudioRecordStartSuccess(state.controller));
    } catch (error) {
      log('AudioRecordStartFailure: $error');
      emit(AudioRecordStartFailure(state.controller));
    }
  }

  /// Stops recording and saves audio file.
  Future<void> _onStopRecord(
    AudioRecordStopRequested event,
    Emitter<AudioRecordState> emit,
  ) async {
    final state = this.state;
    if (state is! AudioRecordInitializeSuccess) return;

    try {
      final audioData = await _stopAudioRecordUseCase(state.controller);
      if (audioData != null) {
        emit(
          AudioRecordStopSuccess(
            state.controller,
            audioPath: audioData.audioPath,
            duration: audioData.duration,
          ),
        );
        return;
      }
      emit(AudioRecordStopSuccess(state.controller));
    } catch (error) {
      log('AudioRecordStopFailure: $error');
      emit(AudioRecordStopFailure(state.controller));
    }
  }
}
