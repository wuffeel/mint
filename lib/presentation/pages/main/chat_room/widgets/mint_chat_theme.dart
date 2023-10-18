import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../theme/mint_text_styles.dart';

class MintChatTheme extends DefaultChatTheme {
  MintChatTheme(BuildContext context)
      : super(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          messageInsetsHorizontal: 11.w,
          messageInsetsVertical: 11.h,
          messageBorderRadius: 10.r,
          primaryColor: Theme.of(context).colorScheme.primary,
          secondaryColor: Theme.of(context).colorScheme.secondary,
          sentMessageBodyTextStyle:
              MintTextStyles.proximaNova14Regular.copyWith(
            color: _getMessageTextColor(context, true),
          ),
          receivedMessageBodyTextStyle:
              MintTextStyles.proximaNova14Regular.copyWith(
            color: _getMessageTextColor(context, false),
          ),
          receivedMessageDocumentIconColor: Theme.of(context).primaryColor,
          receivedMessageLinkTitleTextStyle: MintTextStyles.headline1.copyWith(
            color: Theme.of(context).primaryColor,
          ),
          receivedMessageLinkDescriptionTextStyle: MintTextStyles.body1
              .copyWith(color: Theme.of(context).primaryColor),
          typingIndicatorTheme: TypingIndicatorTheme(
            animatedCirclesColor: neutral1,
            animatedCircleSize: 5,
            bubbleBorder: const BorderRadius.all(Radius.circular(27)),
            bubbleColor: Theme.of(context).scaffoldBackgroundColor,
            countAvatarColor: primary,
            countTextColor: secondary,
            multipleUserTextStyle: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: neutral2,
            ),
          ),
        );

  static bool _isThemeDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color _getMessageTextColor(BuildContext context, bool isSender) {
    return _isThemeDark(context)
        ? Colors.white
        : isSender
            ? Colors.white
            : Colors.black;
  }
}
