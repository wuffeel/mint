import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    );
  }
}
