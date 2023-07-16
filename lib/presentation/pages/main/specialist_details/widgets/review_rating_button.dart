import 'package:flutter/material.dart';
import 'package:mint/presentation/widgets/mint_rating_bar.dart';
import 'package:mint/presentation/widgets/single_button_container.dart';
import 'package:mint/theme/mint_text_styles.dart';

class ReviewRatingButton<T> extends StatelessWidget {
  const ReviewRatingButton({
    super.key,
    required this.value,
    required this.onSelect,
    required this.title,
    required this.rating,
    required this.isSelected,
  });

  final T value;
  final void Function(T) onSelect;
  final String title;
  final double rating;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: !isSelected ? () => onSelect(value) : null,
      child: SingleButtonContainer(
        isSelected: isSelected,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title, style: MintTextStyles.body1),
            MintRatingBar(rating: rating),
          ],
        ),
      ),
    );
  }
}
