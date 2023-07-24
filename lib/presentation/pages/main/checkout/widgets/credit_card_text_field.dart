import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_text_form_field.dart';

class CreditCardTextField extends StatefulWidget {
  const CreditCardTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.hintText,
    this.errorText,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final String? hintText;
  final String? errorText;

  @override
  State<CreditCardTextField> createState() => _CreditCardTextFieldState();
}

class _CreditCardTextFieldState extends State<CreditCardTextField> {
  final _cardMaskFormatter = MaskTextInputFormatter(
    mask: '#### #### #### ####',
    filter: {'#': RegExp('[0-9]')},
  );

  String? _cardNumberValidator(String? value) {
    if (value == null) return null;
    final unmaskedValue = _cardMaskFormatter.getUnmaskedText();
    if (unmaskedValue.length < 10) return context.l10n.wrongCardNumber;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return MintTextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      hintText: widget.hintText,
      errorText: widget.errorText,
      onChanged: (text) {
        final onChanged = widget.onChanged;
        if (onChanged != null) {
          onChanged(_cardMaskFormatter.getUnmaskedText());
        }
      },
      inputFormatters: [_cardMaskFormatter],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      validator: _cardNumberValidator,
    );
  }
}
