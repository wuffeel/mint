import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_text_field.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.errorText,
  });

  final TextEditingController controller;
  final void Function(String) onChanged;
  final String? errorText;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintTextField(
      controller: widget.controller,
      maxLength: 15,
      errorText: widget.errorText,
      hintText: l10n.phoneNumber,
      onChanged: widget.onChanged,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
    );
  }
}
