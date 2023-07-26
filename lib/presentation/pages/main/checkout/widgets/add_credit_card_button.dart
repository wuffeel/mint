import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class AddCreditCardButton extends StatelessWidget {
  const AddCreditCardButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 28.w,
            height: 28.h,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              shape: BoxShape.circle,
            ),
            child: Assets.svg.plusIcon.svg(
              width: 17.w,
              height: 17.h,
              fit: BoxFit.scaleDown,
              colorFilter: ColorFilter.mode(
                Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : MintColors.quarternary1,
                BlendMode.srcIn,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Text(l10n.addCreditCard, style: MintTextStyles.tab16),
        ],
      ),
    );
  }
}
