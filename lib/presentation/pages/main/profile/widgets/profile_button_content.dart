import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class ProfileButtonContent extends StatelessWidget {
  const ProfileButtonContent({
    super.key,
    required this.title,
    required this.svgIcon,
    this.isChevronVisible = true,
    this.foregroundColor,
  });

  final String title;
  final SvgGenImage svgIcon;
  final bool isChevronVisible;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        svgIcon.svg(
          width: 16.w,
          height: 16.h,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(
            foregroundColor ?? Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          title,
          style: MintTextStyles.title3.copyWith(color: foregroundColor),
        ),
        const Spacer(),
        if (isChevronVisible)
          Assets.svg.chevronRight.svg(
            width: 24.w,
            height: 24.h,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? MintColors.greyDark.withOpacity(0.6)
                  : MintColors.grey1,
              BlendMode.srcIn,
            ),
          ),
      ],
    );
  }
}
