import 'package:flutter/material.dart';
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
    required this.onAudio,
    this.isEmojiSelected = false,
    this.onTextFieldTap,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onEmoji;
  final VoidCallback onAttach;
  final VoidCallback onAudio;
  final bool isEmojiSelected;
  final VoidCallback? onTextFieldTap;

  @override
  State<ChatBottomBar> createState() => _ChatBottomBarState();
}

class _ChatBottomBarState extends State<ChatBottomBar> {
  late final TextEditingController _textController;
  bool _sendButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _textController = widget.controller;
    _sendButtonVisible = _textController.text.trim() != '';
    _textController.addListener(_handleSendVisibility);
  }

  void _handleSendVisibility() {
    setState(() {
      _sendButtonVisible = _textController.text.trim() != '';
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: widget.onAttach,
            child: _BottomBarIcon(Assets.svg.attachIcon),
          ),
          SizedBox(width: 9.w),
          Expanded(
            child: TextField(
              onTap: widget.onTextFieldTap,
              controller: _textController,
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
                        onTap: widget.onEmoji,
                        child: _BottomBarIcon(
                          Assets.svg.emojiIcon,
                          color: widget.isEmojiSelected
                              ? Theme.of(context).colorScheme.primary
                              : null,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: _sendButtonVisible,
                      maintainAnimation: true,
                      maintainState: true,
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: _sendButtonVisible ? 1 : 0,
                        child: IconButton(
                          onPressed: widget.onSend,
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
          InkWell(
            onTap: widget.onAudio,
            child: _BottomBarIcon(Assets.svg.microphoneIcon),
          ),
        ],
      ),
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
