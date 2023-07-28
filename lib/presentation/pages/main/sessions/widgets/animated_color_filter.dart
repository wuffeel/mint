import 'package:flutter/material.dart';

class AnimatedColorFilter extends StatelessWidget {
  const AnimatedColorFilter({
    super.key,
    required this.child,
    required this.isSelected,
    required this.selectedColor,
    required this.unselectedColor,
    required this.animationDuration,
  });

  final Widget child;
  final bool isSelected;
  final Color selectedColor;
  final Color unselectedColor;
  final Duration animationDuration;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color?>(
      tween: ColorTween(
        begin: isSelected ? unselectedColor : selectedColor,
        end: isSelected ? selectedColor : unselectedColor,
      ),
      duration: animationDuration,
      builder: (context, color, child) {
        return ColorFiltered(
          colorFilter: ColorFilter.mode(
            color ?? Colors.transparent,
            BlendMode.srcIn,
          ),
          child: child,
        );
      },
      child: child,
    );
  }
}
