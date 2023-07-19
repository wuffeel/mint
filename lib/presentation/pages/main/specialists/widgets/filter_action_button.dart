import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';

class FilterActionButton extends StatelessWidget {
  const FilterActionButton({
    super.key,
    required this.isBadgeVisible,
    required this.onPressed,
  });

  final bool isBadgeVisible;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Badge(
        backgroundColor: Theme.of(context).colorScheme.primary,
        smallSize: 8.r,
        isLabelVisible: isBadgeVisible,
        child: Assets.svg.filterIcon.svg(
          width: 24.w,
          height: 24.h,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            Theme.of(context).iconTheme.color ?? Colors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
