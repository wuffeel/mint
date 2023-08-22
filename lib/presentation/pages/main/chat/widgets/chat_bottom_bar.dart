import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/audio_record/audio_record_bloc.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/assets.gen.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onEmoji,
    required this.onAttach,
    required this.onAudioStop,
    this.isEmojiSelected = false,
    this.onTextFieldTap,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onEmoji;
  final VoidCallback onAttach;
  final void Function(types.PartialAudio) onAudioStop;
  final bool isEmojiSelected;
  final VoidCallback? onTextFieldTap;

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  final _recorderController = RecorderController()
    ..updateFrequency = const Duration(milliseconds: 150)
    ..bitRate = 48000;

  late final TextEditingController _textController;
  bool _isSendButtonVisible = false;
  bool _isAudioRecording = false;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller;
    _isSendButtonVisible = _textController.text.trim() != '';
    _textController.addListener(_handleSendVisibility);
  }

  void _handleSendVisibility() {
    setState(() {
      _isSendButtonVisible = _textController.text.trim() != '';
    });
  }

  Future<void> _startRecord() async {
    final permission = await _recorderController.checkPermission();
    if (permission) {
      await _recorderController.record();
      setState(() => _isAudioRecording = true);
    }
  }

  void _startRecord() {
    context
        .read<AudioRecordBloc>()
        .add(AudioRecordStartRequested(_recorderController));
  }

  void _stopRecord() {
    context
        .read<AudioRecordBloc>()
        .add(AudioRecordStopRequested(_recorderController));
  }

  @override
  void dispose() {
    _recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioRecordBloc, AudioRecordState>(
      listener: (_, state) => _audioRecordBlocListener(state),
      builder: (context, state) {
        return ColoredBox(
          color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Row(
              children: <Widget>[
                if (state is! AudioRecordStartSuccess)
                  Expanded(
                    child: _ChatToolbar(
                      messageController: _textController,
                      onAttachTap: widget.onAttach,
                      onSendTap: widget.onSend,
                      onEmojiTap: widget.onEmoji,
                      onTextFieldTap: widget.onTextFieldTap,
                      isEmojiSelected: widget.isEmojiSelected,
                      isSendButtonVisible: _isSendButtonVisible,
                    ),
                  )
                else
                  Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Padding(
                          padding: EdgeInsets.only(left: 16.w),
                          child: AudioWaveforms(
                            recorderController: _recorderController,
                            size: Size(constraints.maxWidth, 30.h),
                            enableGesture: true,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            margin: EdgeInsets.only(right: 10.w),
                            padding: EdgeInsets.all(10.w),
                            waveStyle: const WaveStyle(
                              waveColor: Colors.white,
                              showMiddleLine: false,
                              extendWaveform: true,
                              spacing: 6,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                Offstage(
                  offstage: state is AudioRecordStartSuccess,
                  child: IconButton(
                    onPressed: _startRecord,
                    icon: _BottomBarIcon(Assets.svg.microphoneIcon),
                  ),
                ),
                Offstage(
                  offstage: state is! AudioRecordStartSuccess,
                  child: IconButton(
                    onPressed: _stopRecord,
                    icon: Icon(
                      Icons.stop_circle_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 24.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ChatToolbar extends StatelessWidget {
  const _ChatToolbar({
    required this.messageController,
    required this.onAttachTap,
    required this.onSendTap,
    required this.onEmojiTap,
    required this.isEmojiSelected,
    required this.isSendButtonVisible,
    this.onTextFieldTap,
  });

  final TextEditingController messageController;
  final VoidCallback onAttachTap;
  final VoidCallback onSendTap;
  final VoidCallback onEmojiTap;
  final bool isEmojiSelected;
  final bool isSendButtonVisible;
  final VoidCallback? onTextFieldTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          onPressed: onAttachTap,
          icon: _BottomBarIcon(Assets.svg.attachIcon),
        ),
        Expanded(
          child: TextField(
            onTap: onTextFieldTap,
            controller: messageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(40.r),
              ),
              suffixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6),
                    child: IconButton(
                      onPressed: onEmojiTap,
                      constraints: const BoxConstraints(),
                      icon: _BottomBarIcon(
                        Assets.svg.emojiIcon,
                        color: isEmojiSelected
                            ? Theme.of(context).colorScheme.primary
                            : null,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: isSendButtonVisible,
                    maintainAnimation: true,
                    maintainState: true,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: isSendButtonVisible ? 1 : 0,
                      child: IconButton(
                        constraints: const BoxConstraints(),
                        onPressed: onSendTap,
                        icon: Icon(
                          Icons.send,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              hintText: context.l10n.message,
            ),
          ),
        ),
      ],
    );
  }
}

class _BottomBarIcon extends StatelessWidget {
  const _BottomBarIcon(this.svgImage, {this.color});

  final SvgGenImage svgImage;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return svgImage.svg(
      width: 24.w,
      height: 24.h,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        color ?? Theme.of(context).hintColor.withOpacity(0.6),
        BlendMode.srcIn,
      ),
    );
  }
}
