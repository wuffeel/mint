import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

  /// Stops recording and saves audio file. Calls onAudioStop function with
  /// message formed by audio file info.
  Future<void> _stopRecord() async {
    setState(() => _isAudioRecording = false);
    final audioPath = await _recorderController.stop();
    if (audioPath != null) {
      final file = File(audioPath);
      final message = types.PartialAudio(
        duration: _recorderController.recordedDuration,
        name: file.path.split(Platform.pathSeparator).last,
        size: file.lengthSync(),
        uri: file.uri.toString(),
      );
      widget.onAudioStop(message);
    }
  }

  @override
  void dispose() {
    _recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: <Widget>[
          if (!_isAudioRecording)
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
                  return AudioWaveforms(
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
                  );
                },
              ),
            ),
          Offstage(
            offstage: _isAudioRecording,
            child: InkWell(
              onTap: _startRecord,
              child: _BottomBarIcon(Assets.svg.microphoneIcon),
            ),
          ),
          Offstage(
            offstage: !_isAudioRecording,
            child: InkWell(
              onTap: _stopRecord,
              child: Icon(
                Icons.stop_circle_rounded,
                color: Theme.of(context).colorScheme.primary,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
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
        InkWell(
          onTap: onAttachTap,
          child: _BottomBarIcon(Assets.svg.attachIcon),
        ),
        SizedBox(width: 9.w),
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
                    padding: const EdgeInsets.only(left: 8),
                    child: InkWell(
                      onTap: onEmojiTap,
                      child: _BottomBarIcon(
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
        SizedBox(width: 9.w),
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
