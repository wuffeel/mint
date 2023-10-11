import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_circle_avatar.dart';
import 'package:mint_core/mint_utils.dart';

import '../../../../../theme/mint_text_styles.dart';

class ChatRoomTile extends StatelessWidget {
  const ChatRoomTile({
    super.key,
    required this.user,
    required this.lastMessage,
    required this.onTap,
    this.unreadCount = 0,
    this.roomLastDate,
  });

  /// The user with whom the current user is engaged in a conversation.
  final types.User user;

  final types.Message? lastMessage;
  final VoidCallback? onTap;
  final int? roomLastDate;
  final int unreadCount;

  String _getLastMessageContent(
    BuildContext context,
    types.Message lastMessage,
  ) {
    final l10n = context.l10n;
    if (lastMessage is types.TextMessage) {
      return lastMessage.text;
    } else if (lastMessage is types.ImageMessage) {
      return l10n.imageMessage;
    } else if (lastMessage is types.FileMessage) {
      return lastMessage.name;
    } else if (lastMessage is types.AudioMessage) {
      return l10n.voiceMessage;
    }
    return '';
  }

  String? get _fullName => user.firstName != null && user.lastName != null
      ? '${user.firstName} ${user.lastName}'
      : null;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final message = lastMessage;
    final lastDate =
        lastMessage?.updatedAt ?? lastMessage?.createdAt ?? roomLastDate;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 70.h,
        child: Row(
          children: <Widget>[
            MintCircleAvatar(
              radius: 27,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              photoUrl: user.imageUrl,
            ),
            SizedBox(width: 14.w),
            Expanded(
              child: FractionallySizedBox(
                heightFactor: 0.75,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      _fullName ?? l10n.psychologist,
                      maxLines: 2,
                      style: MintTextStyles.headline1,
                    ),
                    Text(
                      message != null
                          ? _getLastMessageContent(context, message)
                          : l10n.noMessagesYet,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14.sp),
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8.w),
            FractionallySizedBox(
              heightFactor: 0.75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  if (lastDate != null)
                    Text(
                      ChatUtils.chatRoomLastDateToString(
                        lastDate,
                        locale: l10n.localeName,
                      ),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  if (unreadCount != 0)
                    _UnreadMessagesCircle(unreadCount: unreadCount)
                  else if (lastMessage?.status == types.Status.delivered &&
                      lastMessage?.author.id != user.id)
                    Image.asset(
                      'assets/icon-delivered.png',
                      color: Theme.of(context).colorScheme.primary,
                      package: 'flutter_chat_ui',
                    )
                  else if (lastMessage?.status == types.Status.seen &&
                      lastMessage?.author.id != user.id)
                    Image.asset(
                      'assets/icon-seen.png',
                      color: Theme.of(context).colorScheme.primary,
                      package: 'flutter_chat_ui',
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UnreadMessagesCircle extends StatelessWidget {
  const _UnreadMessagesCircle({required this.unreadCount});

  final int unreadCount;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(6.w),
        child: Text(
          unreadCount.toString(),
          style: TextStyle(fontSize: 14.sp, color: Colors.white),
        ),
      ),
    );
  }
}
