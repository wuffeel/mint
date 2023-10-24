import 'package:flutter/material.dart';

import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_app_bar.dart';

class ChatPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatPageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: MintAppBar(
        title: Text('Messages', style: MintTextStyles.headline1),
        centerTitle: true,
      ),
    );
  }
}
