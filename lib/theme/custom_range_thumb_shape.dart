import 'package:flutter/material.dart';
import 'package:mint/theme/mint_text_styles.dart';

class CustomRangeThumbShape extends RangeSliderThumbShape {
  CustomRangeThumbShape({
    this.thumbSize = 16,
    required this.values,
    required this.textColor,
  });

  final double thumbSize;
  final RangeValues values;
  final Color textColor;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbSize, thumbSize);
  }

  @override
  // ignore: long-parameter-list
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    bool? isDiscrete,
    bool? isEnabled,
    bool? isOnTop,
    TextDirection? textDirection,
    required SliderThemeData sliderTheme,
    Thumb? thumb,
    bool? isPressed,
  }) {
    final canvas = context.canvas;
    final thumbBounds =
        Rect.fromCenter(center: center, width: thumbSize, height: thumbSize);
    final paint = Paint()
      ..color = sliderTheme.thumbColor ?? Colors.white
      ..style = PaintingStyle.fill;

    canvas.drawOval(thumbBounds, paint);
    TextSpan textSpan;
    TextPainter textPainter;

    if (thumb == Thumb.start) {
      textSpan = TextSpan(
        text: '${values.start.round()}₴',
        style: MintTextStyles.callOut.copyWith(color: textColor),
      );
      textPainter = TextPainter(
        text: textSpan,
        textDirection: textDirection,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(
          center.dx - textPainter.width / 2,
          thumbBounds.center.dy +
              thumbSize / 2 +
              4.0, // Adjust the offset as needed
        ),
      );
    } else if (thumb == Thumb.end) {
      textSpan = TextSpan(
        text: '${values.end.round()}₴',
        style: MintTextStyles.callOut.copyWith(color: textColor),
      );
      textPainter = TextPainter(
        text: textSpan,
        textDirection: textDirection,
      )..layout();
      textPainter.paint(
        canvas,
        Offset(
          center.dx - textPainter.width / 2,
          thumbBounds.center.dy +
              thumbSize / 2 +
              4.0, // Adjust the offset as needed
        ),
      );
    }
  }
}
