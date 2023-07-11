import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';

class BottomSheetContainer extends StatelessWidget {
  const BottomSheetContainer({
    super.key,
    required this.child,
    this.padding,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.9,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? MintColors.backgroundDark
            : MintColors.scaffoldLight,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 12.h),
          Container(
            width: 64.w,
            height: 4.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: MintColors.bottomSheetTopLine,
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}
