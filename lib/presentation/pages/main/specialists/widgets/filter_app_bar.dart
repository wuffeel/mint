import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class FilterAppBar extends StatelessWidget {
  const FilterAppBar({super.key, this.onClear});

  final VoidCallback? onClear;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return LimitedBox(
      maxHeight: kToolbarHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Theme.of(context).dividerColor),
          ),
        ),
        child: NavigationToolbar(
          leading: InkWell(
            onTap: context.router.pop,
            child: Assets.svg.crossIcon.svg(
              width: 18.w,
              height: 18.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).iconTheme.color ?? Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          middle: Text(l10n.filterTitle, style: MintTextStyles.title2),
          trailing: InkWell(
            onTap: onClear,
            child: Text(
              l10n.clear,
              style: MintTextStyles.tagBig.copyWith(
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
