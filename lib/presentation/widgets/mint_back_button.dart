import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

class MintBackButton extends StatelessWidget {
  const MintBackButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  SvgGenImage _getIcon(BuildContext context) {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return Assets.svg.arrowBackAndroid;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return Assets.svg.arrowBackIos;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed ?? context.router.pop,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 28.w,
            height: 28.h,
            alignment: Alignment.center,
            child: _getIcon(context).svg(),
          ),
          Text(context.l10n.back, style: MintTextStyles.body),
        ],
      ),
    );
  }
}
