import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_text_form_field.dart';

class CardExpirationTextField extends StatefulWidget {
  const CardExpirationTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;

  @override
  State<CardExpirationTextField> createState() =>
      _CardExpirationTextFieldState();
}

class _CardExpirationTextFieldState extends State<CardExpirationTextField> {
  final _expirationFormatter = MaskTextInputFormatter(
    mask: '##/##',
    filter: {'#': RegExp('[0-9]')},
  );

  String? _expirationDateValidator(String? value) {
    if (value == null) return null;
    final unmaskedValue = _expirationFormatter.getUnmaskedText();
    log(unmaskedValue);
    final month = int.parse(unmaskedValue.substring(0, 2));
    final year = int.parse(
      unmaskedValue.substring(2, unmaskedValue.length),
    );
    final currentYear = int.parse(
      DateTime.now().year.toString().padLeft(2, '0'),
    );
    if (month < 1 || month > 12 || year < currentYear) {
      return context.l10n.wrongExpirationDate;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MintTextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: 'MM/YY',
      onChanged: (text) {
        final onChanged = widget.onChanged;
        if (onChanged != null) {
          onChanged(_expirationFormatter.getUnmaskedText());
        }
      },
      inputFormatters: [_expirationFormatter],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: _expirationDateValidator,
    );
  }
}
