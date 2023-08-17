import 'package:flutter/material.dart';

import '../../gen/assets.gen.dart';

class UndefinedCreditCardIcon extends StatelessWidget {
  const UndefinedCreditCardIcon({
    super.key,
    required this.width,
    required this.height,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Assets.svg.questionMark.svg(
      width: width,
      height: height,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
