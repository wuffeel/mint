import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/theme/mint_text_styles.dart';

class PickUpStepTitle extends StatelessWidget {
  const PickUpStepTitle({super.key, required this.title, required this.child});

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: MintTextStyles.title2),
        SizedBox(height: 16.h),
        Expanded(child: child),
      ],
    );
  }
}
