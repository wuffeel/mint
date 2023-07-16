import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.photo, this.nameTag});

  final String? photo;
  final String? nameTag;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 0.5.h);

  @override
  Widget build(BuildContext context) {
    final localPhoto = photo;
    return AppBar(
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(0.5.h),
        child: Divider(
          height: 0.5.h,
          color: Theme.of(context).brightness == Brightness.dark
              ? MintColors.elementsGreyDark
              : MintColors.grey1,
        ),
      ),
      title: Row(
        children: <Widget>[
          if (localPhoto != null)
            CircleAvatar(
              radius: 14.r,
              backgroundImage: NetworkImage(localPhoto),
            )
          else
            CircleAvatar(
              radius: 14.r,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              child: Assets.svg.userPlaceholder.svg(
                width: 14.w,
                height: 14.h,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          SizedBox(width: 8.w),
          Text(
            // TODO(wuffeel): what user tag placeholder should be used?
            '@${nameTag ?? 'user'}',
            style: MintTextStyles.headline1.copyWith(height: 1),
          )
        ],
      ),
      actions: [
        IconButton(
          onPressed: null,
          icon: Assets.svg.bellIcon.svg(
            width: 28.w,
            height: 28.h,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              Theme.of(context).brightness == Brightness.dark
                  ? MintColors.elementsGreyDark
                  : MintColors.grey1,
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }
}
