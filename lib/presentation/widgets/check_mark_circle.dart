import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';

class CheckMarkCircle extends StatelessWidget {
  const CheckMarkCircle({
    super.key,
    required this.width,
    required this.height,
    required this.isSelected,
  });

  final double width;
  final double height;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: !isSelected ? Border.all(color: MintColors.grey2) : null,
        color: isSelected ? Theme.of(context).colorScheme.primary : null,
        shape: BoxShape.circle,
      ),
      child: isSelected
          ? Assets.svg.checkMark.svg(
              width: width * 0.65,
              height: height * 0.45,
              fit: BoxFit.scaleDown,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            )
          : null,
    );
  }
}
