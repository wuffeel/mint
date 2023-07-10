import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';

class PickUpSingleButton extends StatelessWidget {
  const PickUpSingleButton({
    super.key,
    required this.title,
    required this.onSelect,
    required this.isSelected,
  });

  final String title;
  final VoidCallback? onSelect;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                )
              : null,
          color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: MintTextStyles.body),
            Container(
              width: 20.w,
              height: 20.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border:
                    !isSelected ? Border.all(color: MintColors.grey2) : null,
                color:
                    isSelected ? Theme.of(context).colorScheme.primary : null,
                shape: BoxShape.circle,
              ),
              child: isSelected
                  ? Assets.svg.checkMark.svg(
                      colorFilter: const ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
