import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/assets.gen.dart';

class ChatBottomBar extends StatefulWidget {
  const ChatBottomBar({
    super.key,
    required this.controller,
    required this.onSend,
    required this.onAttach,
    required this.onAudio,
  });

  final TextEditingController controller;
  final VoidCallback onSend;
  final VoidCallback onAttach;
  final VoidCallback onAudio;

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
                        onTap: () {
                          // TODO(wuffeel): handle emoji tap
                        },
                        child: _BottomBarIcon(Assets.svg.emojiIcon),
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
                          icon: const Icon(Icons.send),
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
  const _BottomBarIcon(this.svgImage);

  final SvgGenImage svgImage;

  @override
  Widget build(BuildContext context) {
    return svgImage.svg(
      width: 24.w,
      height: 24.h,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        Theme.of(context).hintColor.withOpacity(0.6),
        BlendMode.srcIn,
      ),
    );
  }
}
