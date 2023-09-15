import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
    required this.isLast,
    required this.isSender,
    required this.enlargeEmojis,
    required this.hideBackgroundOnEmojiMessages,
    required this.child,
  });

  final types.Message message;
  final bool isLast;
  final bool isSender;
  final bool enlargeEmojis;
  final bool hideBackgroundOnEmojiMessages;
  final Widget child;

  BorderRadius _getBorderShape(bool isSender, bool isLast) {
    return BorderRadius.only(
      topLeft: Radius.circular(10.r),
      topRight: Radius.circular(10.r),
      bottomRight: Radius.circular(!isSender || !isLast ? 10.r : 0),
      bottomLeft: Radius.circular(isSender || !isLast ? 10.r : 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment:
          isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        if (enlargeEmojis && hideBackgroundOnEmojiMessages)
          child
        else
          DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: _getBorderShape(isSender, isLast).resolve(
                Directionality.of(context),
              ),
              color: !isSender || message.type == types.MessageType.image
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
            ),
            child: ClipRRect(
              borderRadius: _getBorderShape(isSender, isLast).resolve(
                Directionality.of(context),
              ),
              child: child,
            ),
          ),
        if (isLast) ...[
          SizedBox(height: 8.h),
          _MessageCreatedAt(createdAt: message.createdAt),
        ],
      ],
    );
  }
}

class _MessageCreatedAt extends StatelessWidget {
  const _MessageCreatedAt({this.createdAt});

  final int? createdAt;

  @override
  Widget build(BuildContext context) {
    final created = createdAt;
    return Text(
      created != null
          ? DateFormat.Hm().format(
              DateTime.fromMillisecondsSinceEpoch(created),
            )
          : '',
      style: TextStyle(
        fontSize: 10.sp,
        color: Theme.of(context).hintColor.withOpacity(0.6),
      ),
    );
  }
}
