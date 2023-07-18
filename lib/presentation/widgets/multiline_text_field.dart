import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/mint_text_styles.dart';

class MultilineTextField extends StatefulWidget {
  const MultilineTextField({
    super.key,
    this.controller,
    this.scrollController,
    this.maxLines,
    this.hintText,
  });

  final TextEditingController? controller;
  final ScrollController? scrollController;
  final int? maxLines;
  final String? hintText;

  @override
  State<MultilineTextField> createState() => _MultilineTextFieldState();
}

class _MultilineTextFieldState extends State<MultilineTextField> {
  @override
  Widget build(BuildContext context) {
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
        hintText: widget.hintText,
        hintStyle: MintTextStyles.body1.copyWith(
          color: Theme.of(context).hintColor.withOpacity(0.3),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(10.r),
      ),
      keyboardType: TextInputType.multiline,
      maxLines: widget.maxLines,
      style: MintTextStyles.body1,
    );
  }
}
