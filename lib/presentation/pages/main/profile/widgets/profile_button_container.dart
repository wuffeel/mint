import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileButtonContainer extends StatelessWidget {
  const ProfileButtonContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.secondary,
      ),
      padding: EdgeInsets.only(left: 16.w, top: 16.h, bottom: 16.h, right: 7.w),
      child: child,
    );
  }
}
