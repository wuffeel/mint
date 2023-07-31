import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/utils/extended_widget_list.dart';

class PickUpPageDisplay extends StatelessWidget {
  const PickUpPageDisplay({
    super.key,
    required this.itemCount,
    required this.currentStep,
  });

  final int itemCount;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        itemCount,
        (index) => Expanded(
          child: AnimatedContainer(
            height: 3.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: currentStep == index
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).dividerColor,
            ),
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          ),
        ),
      )..insertBetween(SizedBox(width: 8.w)),
    );
  }
}
