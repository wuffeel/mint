import 'package:flutter/material.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';

class PinNumberButton extends StatelessWidget {
  const PinNumberButton({
    super.key,
    required this.onTap,
    required this.number,
    required this.size,
  });

  final int number;
  final void Function(int) onTap;
  final double size;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(number),
      customBorder: const CircleBorder(),
      child: Container(
        width: size,
        height: size,
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
