import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_app_bar.dart';
import '../../../../widgets/mint_circle_avatar.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.user});

  final UserModel user;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final fullName = user.fullName;
    final photoUrl = user.photoUrl;
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: MintAppBar(
        centerTitle: true,
        title: fullName != null
            ? _ChatFullNameText(fullName: fullName)
            : _ChatFullNameText(fullName: context.l10n.psychologist),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 18.w),
            child: MintCircleAvatar(
              radius: 14.w,
              photoUrl: user.photoUrl,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: photoUrl != null
                  ? ClipOval(child: Image.network(photoUrl))
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _ChatFullNameText extends StatelessWidget {
  const _ChatFullNameText({required this.fullName});

  final String? fullName;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$fullName',
      style: MintTextStyles.headline1,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
