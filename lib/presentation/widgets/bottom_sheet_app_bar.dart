import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class BottomSheetAppBar extends StatelessWidget {
  const BottomSheetAppBar({super.key, this.title, this.actions, this.padding});

  final Widget? title;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16.w),
      // Border is not drawn with either Ink or DecoratedBox
      // ignore: use_decorated_box
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: IconButton(
            onPressed: context.router.pop,
            icon: Assets.svg.crossIcon.svg(
              width: 18.w,
              height: 18.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          title: title,
          actions: actions,
          backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? MintColors.backgroundDark
            : MintColors.scaffoldLight,
        ),
      ),
    );
  }
}
