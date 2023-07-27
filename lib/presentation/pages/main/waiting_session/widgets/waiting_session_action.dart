import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';

import '../../../../../gen/assets.gen.dart';

class WaitingSessionAction extends StatelessWidget {
  const WaitingSessionAction({
    super.key,
    required this.svgIcon,
    required this.title,
    this.onTap,
  });

  final VoidCallback? onTap;
  final SvgGenImage svgIcon;
  final String title;

  bool get isDisabled => onTap == null;

  Color _getColor(BuildContext context) {
    final enabledColor = Theme.of(context).brightness == Brightness.dark
        ? MintColors.greyDark.withOpacity(0.6)
        : MintColors.quarternary1;
    final disabledColor = Theme.of(context).hintColor.withOpacity(0.3);
    return isDisabled ? disabledColor : enabledColor;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          svgIcon.svg(
            width: 20.w,
            height: 20.h,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(_getColor(context), BlendMode.srcIn),
          ),
          SizedBox(width: 4.w),
          Text(
            title,
            style: TextStyle(
              fontSize: 14.sp,
              height: 1.05,
              color: _getColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
