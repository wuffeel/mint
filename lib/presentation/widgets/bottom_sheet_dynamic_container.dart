import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';

class BottomSheetDynamicContainer extends StatelessWidget {
  const BottomSheetDynamicContainer({
    super.key,
    required this.appBar,
    required this.child,
  });

  final Widget appBar;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          Column(
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
              appBar,
              child,
            ],
          ),
        ],
      ),
    );
  }
}
