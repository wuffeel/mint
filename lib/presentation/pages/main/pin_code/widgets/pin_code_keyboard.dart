import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/presentation/pages/main/pin_code/widgets/pin_number_button.dart';
import 'package:mint_core/mint_utils.dart';

class PinCodeKeyboard extends StatelessWidget {
  const PinCodeKeyboard({
    super.key,
    required this.onNumTap,
    required this.onBackspace,
    this.mainSpacing,
  });

  final void Function(int) onNumTap;
  final VoidCallback onBackspace;
  final double? mainSpacing;

  double _getItemSize(double maxWidth) {
    return LayoutUtils.getItemWidth(maxWidth, 3, mainSpacing: mainSpacing);
  }

  double _getItemSpacing(double maxWidth) {
    return LayoutUtils.calculateSpacing(maxWidth, 3, mainSpacing: mainSpacing);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final itemSize = _getItemSize(constraints.maxWidth);
        return Wrap(
          spacing: _getItemSpacing(constraints.maxWidth),
          runSpacing: 18.h,
          alignment: WrapAlignment.end,
          children: [
            ...List.generate(
              9,
              (index) => PinNumberButton(
                onTap: onNumTap,
                number: index + 1,
                size: itemSize,
              ),
            ),
            PinNumberButton(onTap: onNumTap, number: 0, size: itemSize),
            InkWell(
              customBorder: const CircleBorder(),
              onTap: onBackspace,
              child: Container(
                width: itemSize,
                height: itemSize,
                alignment: Alignment.center,
                child: Theme.of(context).brightness == Brightness.dark
                    ? Assets.svg.backspaceIconDark.svg()
                    : Assets.svg.backspaceIcon.svg(),
              ),
            ),
          ],
        );
      },
    );
  }
}
