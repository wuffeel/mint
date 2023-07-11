import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/presentation/pages/main/pin_code/widgets/pin_number_button.dart';

class PinCodeKeyboard extends StatelessWidget {
  const PinCodeKeyboard({
    super.key,
    required this.onNumTap,
    required this.onBackspace,
  });

  final void Function(int) onNumTap;
  final VoidCallback onBackspace;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24.w,
      runSpacing: 18.h,
      alignment: WrapAlignment.end,
      children: [
        ...List.generate(
          9,
          (index) => PinNumberButton(onTap: onNumTap, number: index + 1),
        ),
        PinNumberButton(onTap: onNumTap, number: 0),
        InkWell(
          customBorder: const CircleBorder(),
          onTap: onBackspace,
          child: Container(
            width: 78.w,
            height: 78.h,
            alignment: Alignment.center,
            child: Theme.of(context).brightness == Brightness.dark
                ? Assets.svg.backspaceIconDark.svg()
                : Assets.svg.backspaceIcon.svg(),
          ),
        ),
      ],
    );
  }
}
