import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/assets.gen.dart';

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    super.key,
    required this.onTap,
    required this.isFavorite,
    this.isActionButton = false,
  });

  final VoidCallback onTap;
  final bool isFavorite;
  final bool isActionButton;

  SvgGenImage _getFavoriteIconAsset(bool isFavorite) {
    return isFavorite ? Assets.svg.heartIconFilled : Assets.svg.heartIcon;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      padding: isActionButton ? null : EdgeInsets.zero,
      constraints: isActionButton ? null : const BoxConstraints(),
      icon: _getFavoriteIconAsset(isFavorite).svg(
        width: 24.w,
        height: 24.h,
        fit: BoxFit.scaleDown,
        colorFilter: ColorFilter.mode(
          Theme.of(context).iconTheme.color ?? Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
