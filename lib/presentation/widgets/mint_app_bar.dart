import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/presentation/widgets/mint_back_button.dart';

class MintAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MintAppBar({
    super.key,
    this.leading,
    this.title,
    this.actions,
    this.leadingWidth,
  });

  final Widget? leading;
  final double? leadingWidth;
  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: leadingWidth ?? (context.router.canPop() ? 80.w : null),
      leading: context.router.canPop() && leading == null
          ? const MintBackButton()
          : leading,
      title: title,
      actions: actions,
      backgroundColor: Colors.transparent,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5.h),
        child: Divider(height: 0.5.h, color: MintColors.grey1),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 0.5.h);
}
