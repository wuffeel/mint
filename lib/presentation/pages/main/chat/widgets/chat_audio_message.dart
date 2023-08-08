import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../bloc/audio_message/audio_message_cubit.dart';

class ChatAudioMessage extends StatefulWidget {
  const ChatAudioMessage({
    super.key,
    required this.audioMessage,
    this.height,
  });

  final types.AudioMessage audioMessage;
  final double? height;

  @override
  State<ChatAudioMessage> createState() => _ChatAudioMessageState();
}

class _ChatAudioMessageState extends State<ChatAudioMessage> {
  final _cubit = getIt<AudioMessageCubit>();

  final _playerController = PlayerController()
    ..updateFrequency = UpdateFrequency.high;
  late final StreamSubscription<PlayerState> _playerStateSubscription;

  late final _playerSize = MediaQuery.sizeOf(context).width / 2;

  @override
  void initState() {
    super.initState();
    _playerStateSubscription =
        _playerController.onPlayerStateChanged.listen((_) {
      setState(() {
        // TODO(wuffeel): refreshes state on starting or stopping player
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _cubit.loadAudioMessage(
        widget.audioMessage,
        _playerController,
        _playerSize,
      );
    });
  }

  @override
  void dispose() {
    _playerController.dispose();
    _playerStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioMessageCubit, AudioMessageState>(
      bloc: _cubit,
      builder: (context, state) {
        if (state is AudioMessageLoading) {
          return SizedBox(
            height: 24.h,
            width: 24.w,
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          );
        }
        if (state is AudioMessageLoadFailure) {
          return const SizedBox.shrink();
        }
        if (state is AudioMessageLoadSuccess) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: () async {
                  _playerController.playerState.isPlaying
                      ? await _playerController.pausePlayer()
                      : await _playerController.startPlayer(
                          finishMode: FinishMode.pause,
                        );
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                child: Icon(
                  _playerController.playerState.isPlaying
                      ? Icons.stop
                      : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 8.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  AudioFileWaveforms(
                    size: Size(_playerSize, widget.height ?? 40.h),
                    playerController: _playerController,
                    waveformData: widget.audioMessage.waveForm ?? [],
                    waveformType: WaveformType.fitWidth,
                  ),
                  SizedBox(height: 4.h),
                  if (_playerController.playerState.isPlaying ||
                      _playerController.playerState.isPaused)
                    StreamBuilder(
                      stream: _playerController.onCurrentDurationChanged,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          final currentDuration = snapshot.data;
                          if (currentDuration != null) {
                            return _DurationMinutesText(
                              Duration(milliseconds: currentDuration),
                            );
                          }
                        }
                        return Text(
                          '00:00',
                          style: MintTextStyles.callOut3
                              .copyWith(color: Colors.white),
                        );
                      },
                    )
                  else
                    _DurationMinutesText(
                      Duration(
                        milliseconds: _playerController.maxDuration,
                      ),
                    ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _DurationMinutesText extends StatelessWidget {
  const _DurationMinutesText(this.duration);

  final Duration duration;

  String _getTimeDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getTimeDuration(duration),
      style: MintTextStyles.callOut3.copyWith(
        color: Colors.white,
      ),
    );
  }
}
