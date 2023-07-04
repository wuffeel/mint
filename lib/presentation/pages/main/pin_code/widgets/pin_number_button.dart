import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';

class PinNumberButton extends StatelessWidget {
  const PinNumberButton({super.key, required this.onTap, required this.number});

  final int number;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(number),
      customBorder: const CircleBorder(),
      child: Container(
        width: 78.w,
        height: 78.h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? MintColors.numberDark
              : MintColors.numberLight,
          shape: BoxShape.circle,
        ),
        child: Text('$number', style: MintTextStyles.sfProDisplay37Regular400),
      ),
    );
  }
}
