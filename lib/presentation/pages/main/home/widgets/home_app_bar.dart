import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/presentation/widgets/mint_circle_avatar.dart';
import 'package:mint/theme/mint_text_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.photo, this.nameTag});

  final String? photo;
  final String? nameTag;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Theme.of(context).dividerColor),
        ),
      ),
      child: AppBar(
        title: Row(
          children: <Widget>[
            MintCircleAvatar(
              radius: 14.w,
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            SizedBox(width: 8.w),
            Text(
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
      ),
    );
  }
}
