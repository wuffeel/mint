import 'package:flutter/material.dart';
import 'package:mint/theme/mint_text_styles.dart';

class MintElevatedButton extends StatelessWidget {
  const MintElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
  });

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: MintTextStyles.headline,
      ),
    );
  }
}
