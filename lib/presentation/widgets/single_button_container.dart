import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleButtonContainer extends StatelessWidget {
  const SingleButtonContainer({
    super.key,
    required this.isSelected,
    required this.child,
  });

  final bool isSelected;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: isSelected
            ? Border.all(
                color: Theme.of(context).colorScheme.primary,
                strokeAlign: BorderSide.strokeAlignOutside,
              )
            : null,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: child,
    );
  }
}
