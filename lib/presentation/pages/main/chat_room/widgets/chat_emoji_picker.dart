import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';

class ChatEmojiPicker extends StatefulWidget {
  const ChatEmojiPicker({
    super.key,
    required this.controller,
    required this.onBackSpace,
  });

  final TextEditingController controller;
  final VoidCallback onBackSpace;

  @override
  State<ChatEmojiPicker> createState() => _ChatEmojiPickerState();
}

class _ChatEmojiPickerState extends State<ChatEmojiPicker> {
  @override
  Widget build(BuildContext context) {
    return EmojiPicker(
      config: Config(
        buttonMode: Theme.of(context).platform == TargetPlatform.iOS
            ? ButtonMode.CUPERTINO
            : ButtonMode.MATERIAL,
        emojiSet: defaultEmojiSet,
        // Issue: https://github.com/flutter/flutter/issues/28894
        emojiSizeMax:
            32 * (Theme.of(context).platform == TargetPlatform.iOS ? 1.3 : 1.0),
      ),
      onBackspacePressed: widget.onBackSpace,
      textEditingController: widget.controller,
    );
  }
}
