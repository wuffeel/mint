import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';

class FavoriteIcon extends StatelessWidget {
  const FavoriteIcon({super.key, this.isFavorite = false});

  final bool isFavorite;

  SvgGenImage _getFavoriteIconAsset(bool isFavorite) {
    return isFavorite ? Assets.svg.heartIconFilled : Assets.svg.heartIcon;
  }

  @override
  Widget build(BuildContext context) {
    return _getFavoriteIconAsset(isFavorite).svg(
      width: 24.w,
      height: 24.h,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(
        Theme.of(context).iconTheme.color ?? Colors.white,
        BlendMode.srcIn,
      ),
    );
  }
}
