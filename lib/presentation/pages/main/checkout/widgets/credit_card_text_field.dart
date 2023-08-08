import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CreditCardTextField extends StatefulWidget {
  const CreditCardTextField({
    super.key,
    this.controller,
    this.onCardChanged,
  });

  final CardEditController? controller;
  final void Function(CardFieldInputDetails?)? onCardChanged;

  @override
  State<CreditCardTextField> createState() => _CreditCardTextFieldState();
}

class _CreditCardTextFieldState extends State<CreditCardTextField> {
  @override
  Widget build(BuildContext context) {
    return CardField(
      controller: widget.controller,
      numberHintText: 'XXXX XXXX XXXX XXXX',
      cvcHintText: 'CVV',
      expirationHintText: 'MM/YY',
      onCardChanged: widget.onCardChanged,
      dangerouslyGetFullCardDetails: true,
    );
  }
}
