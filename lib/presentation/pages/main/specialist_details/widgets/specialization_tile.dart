import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';

class SpecializationTile extends StatelessWidget {
  const SpecializationTile({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? MintColors.fillSecondaryDark.withOpacity(0.15)
            : MintColors.fillSecondaryLight.withOpacity(0.53),
        borderRadius: BorderRadius.circular(30.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 20.w),
      child: Text(title, style: MintTextStyles.tagSmall),
    );
  }
}
