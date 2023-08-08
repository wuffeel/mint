import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';

class MastercardContainer extends StatelessWidget {
  const MastercardContainer({super.key, required this.isSelected});

  final bool isSelected;

  Color _getUnselectedColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.grey1
        : MintColors.greyLight.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.r),
        color: isSelected ? Colors.white : _getUnselectedColor(context),
      ),
      child: Assets.svg.mastercardIcon.svg(
        colorFilter: ColorFilter.mode(
          isSelected
              ? Theme.of(context).colorScheme.primary
              : Theme.of(context).colorScheme.secondary,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
