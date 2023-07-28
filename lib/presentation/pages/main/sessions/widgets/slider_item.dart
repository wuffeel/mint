import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/sessions/widgets/animated_color_filter.dart';

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
    required this.duration,
    required this.child,
    required this.isSelected,
    required this.onTap,
    this.selectedColor = Colors.white,
    this.unselectedColor = Colors.grey,
  });

  final Duration duration;
  final Widget child;
  final bool isSelected;
  final VoidCallback onTap;
  final Color selectedColor;
  final Color unselectedColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10.r),
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: AnimatedColorFilter(
            selectedColor: selectedColor,
            unselectedColor: unselectedColor,
            isSelected: isSelected,
            animationDuration: duration,
            child: child,
          ),
        ),
      ),
    );
  }
}
