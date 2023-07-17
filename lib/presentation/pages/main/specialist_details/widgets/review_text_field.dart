import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../theme/mint_text_styles.dart';

class ReviewTextField extends StatefulWidget {
  const ReviewTextField({
    super.key,
    required this.controller,
    required this.scrollController,
  });

  final TextEditingController controller;
  final ScrollController scrollController;

  @override
  State<ReviewTextField> createState() => _ReviewTextFieldState();
}

class _ReviewTextFieldState extends State<ReviewTextField> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextField(
      controller: widget.controller,
      scrollController: widget.scrollController,
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        hintText: '${l10n.typeHereYourImpressions}...',
        hintStyle: MintTextStyles.body1.copyWith(
          color: Theme.of(context).hintColor.withOpacity(0.3),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(10.r),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: 3,
      style: MintTextStyles.body1,
    );
  }
}
