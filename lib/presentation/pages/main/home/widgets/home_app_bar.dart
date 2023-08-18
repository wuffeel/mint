import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_circle_avatar.dart';
import 'package:mint/theme/mint_text_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key, this.photo, this.firstName, this.lastName});

  final String? photo;
  final String? firstName;
  final String? lastName;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  String _getNameTag(
    BuildContext context,
    String? firstName,
    String? lastName,
  ) {
    var result = '';
    if (firstName != null) {
      result += firstName.toLowerCase();
    }
    if (lastName != null) {
      result += '-${lastName.toLowerCase()}';
    }
    return result.isNotEmpty ? result : context.l10n.patient;
  }

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
              backgroundColor: Theme.of(context).colorScheme.secondary,
              radius: 14.w,
              photoUrl: photo,
            ),
            SizedBox(width: 8.w),
            Expanded(
              child: Text(
                '@${_getNameTag(context, firstName, lastName)}',
                style: MintTextStyles.headline1.copyWith(height: 1),
              ),
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
