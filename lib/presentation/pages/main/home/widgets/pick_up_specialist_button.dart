import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/routes/app_router.gr.dart';

class PickUpSpecialistButton extends StatelessWidget {
  const PickUpSpecialistButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return ElevatedButton(
      onPressed: () => context.router.push(const PickUpSpecialistRoute()),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Assets.svg.pickUpSpecialist.svg(
            width: 24.w,
            height: 24.h,
            fit: BoxFit.scaleDown,
          ),
          SizedBox(width: 8.w),
          Text(
            l10n.pickUpSpecialist,
            style: TextStyle(fontSize: 16.sp, height: 1.3),
          ),
        ],
      ),
    );
  }
}
