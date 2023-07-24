import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../gen/colors.gen.dart';
import '../../theme/mint_text_styles.dart';

class MintTextField extends StatefulWidget {
  const MintTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.hintText,
    this.errorText,
    this.inputFormatters,
    this.maxLength,
    this.textInputAction,
    this.keyboardType,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  State<MintTextField> createState() => _MintTextFieldState();
}

class _MintTextFieldState extends State<MintTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: Theme.of(context).colorScheme.secondary,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 14.h,
          horizontal: 16.w,
        ),
        errorText: widget.errorText,
        errorStyle: MintTextStyles.caption1,
        errorBorder: widget.errorText != null
            ? OutlineInputBorder(
                borderSide: const BorderSide(
                  color: MintColors.error,
                  strokeAlign: BorderSide.strokeAlignOutside,
                ),
                borderRadius: BorderRadius.circular(8.r),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: MintTextStyles.body.copyWith(
          color: Theme.of(context).hintColor.withOpacity(0.3),
        ),
      ),
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      style: MintTextStyles.body,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
    );
  }
}
