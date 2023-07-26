import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../theme/mint_text_styles.dart';

class MintTextFormField extends StatefulWidget {
  const MintTextFormField({
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
    this.validator,
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
  final String? Function(String?)? validator;

  @override
  State<MintTextFormField> createState() => _MintTextFormFieldState();
}

class _MintTextFormFieldState extends State<MintTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: MintTextStyles.body,
      decoration: InputDecoration(
        counterText: '',
        errorText: widget.errorText,
        hintText: widget.hintText,
      ),
      controller: widget.controller,
      focusNode: widget.focusNode,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      inputFormatters: widget.inputFormatters,
      textInputAction: widget.textInputAction,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
    );
  }
}
