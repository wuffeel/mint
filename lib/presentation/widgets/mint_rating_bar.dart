import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mint/gen/assets.gen.dart';

class MintRatingBar extends StatelessWidget {
  const MintRatingBar({
    super.key,
    required this.rating,
    this.itemSize = 12,
  });

  final double rating;
  final double itemSize;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: rating,
      itemSize: itemSize,
      filledItem: Assets.svg.starIconFilled.svg(
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
        fit: BoxFit.scaleDown,
      ),
      fillStroke: Assets.svg.starIcon.svg(
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary,
          BlendMode.srcIn,
        ),
        fit: BoxFit.scaleDown,
      ),
      disabledStroke: Assets.svg.starIcon.svg(
        colorFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primary.withOpacity(0.5),
          BlendMode.srcIn,
        ),
        fit: BoxFit.scaleDown,
      ),
      clipFillStroke: true,
    );
  }
}
