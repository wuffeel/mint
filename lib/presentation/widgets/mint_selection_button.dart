import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/check_mark_circle.dart';

class MintSelectionButton extends StatelessWidget {
  const MintSelectionButton({
    super.key,
    required this.title,
    required this.isSelected,
    this.hasCheckMark = false,
    this.onSelect,
  });

  final String title;
  final bool isSelected;
  final bool hasCheckMark;
  final VoidCallback? onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(10.r),
          border: isSelected
              ? Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  strokeAlign: BorderSide.strokeAlignOutside,
                )
              : null,
        ),
        child: hasCheckMark
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CheckMarkCircle(
                    width: 16.w,
                    height: 16.h,
                    isSelected: isSelected,
                  ),
                  SizedBox(width: 4.w),
                  Text(title, style: TextStyle(fontSize: 16.sp, height: 1.3)),
                ],
              )
            : Text(title, style: TextStyle(fontSize: 16.sp, height: 1.3)),
      ),
    );
  }
}
