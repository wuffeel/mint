import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/check_mark_circle.dart';

class MintSelectionButton<T> extends StatelessWidget {
  const MintSelectionButton({
    super.key,
    required this.value,
    required this.title,
    required this.isSelected,
    this.hasCheckMark = false,
    this.onSelect,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
    this.width,
  });

  final T value;
  final String title;
  final bool isSelected;
  final bool hasCheckMark;
  final void Function(T)? onSelect;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? width;

  TextStyle? _getTextStyle() {
    if (isDisabled && disabledTextStyle != null) {
      return disabledTextStyle;
    } else if (!isSelected && unselectedTextStyle != null) {
      return unselectedTextStyle;
    } else {
      return itemTextStyle ?? TextStyle(fontSize: 16.sp, height: 1.3);
    }
  }

  bool get isDisabled => onSelect == null && !isSelected;

  @override
  Widget build(BuildContext context) {
    final onSelectLocal = onSelect;
    return InkWell(
      onTap: onSelectLocal != null ? () => onSelectLocal(value) : null,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: width,
        padding: itemInnerPadding ?? EdgeInsets.symmetric(vertical: 12.h),
        alignment: Alignment.center,
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
                  Text(title, style: _getTextStyle()),
                ],
              )
            : Text(title, style: _getTextStyle()),
      ),
    );
  }
}
