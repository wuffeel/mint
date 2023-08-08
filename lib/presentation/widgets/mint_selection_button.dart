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
    this.isDisabled,
    this.itemAlignment,
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
  final bool? isDisabled;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? width;

  TextStyle? _getTextStyle() {
    final disabled = isDisabled;
    if (disabled != null && disabled && disabledTextStyle != null) {
      return disabledTextStyle;
    } else if (!isSelected && unselectedTextStyle != null) {
      return unselectedTextStyle;
    } else {
      return itemTextStyle ?? TextStyle(fontSize: 16.sp, height: 1.3);
    }
  }

  bool get buttonDisabled {
    final disabled = isDisabled;
    return disabled != null && disabled;
  }

  @override
  Widget build(BuildContext context) {
    final onSelectLocal = onSelect;
    return InkWell(
      onTap: buttonDisabled
          ? null
          : onSelectLocal != null
              ? () => onSelectLocal(value)
              : null,
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: width,
        padding: itemInnerPadding,
        alignment: itemAlignment,
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
