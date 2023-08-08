import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/mint_back_button.dart';

class MintAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MintAppBar({
    super.key,
    this.leading,
    this.title,
    this.centerTitle,
    this.actions,
    this.leadingWidth,
  });

  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final bool? centerTitle;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth ??
          (leading == null && context.router.canPop() ? 80.w : null),
      leading:
          leading ?? (context.router.canPop() ? const MintBackButton() : null),
      title: title,
      actions: actions,
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
