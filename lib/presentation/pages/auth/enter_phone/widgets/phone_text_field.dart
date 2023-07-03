import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

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
    return TextField(
      controller: widget.controller,
      maxLength: 15,
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
        errorBorder: widget.errorText != null ? OutlineInputBorder(
          borderSide: const BorderSide(
            color: MintColors.error,
            strokeAlign: BorderSide.strokeAlignOutside,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ) : null,
        hintText: l10n.phoneNumber,
        hintStyle: MintTextStyles.body.copyWith(
          color: Theme.of(context).hintColor.withOpacity(0.3),
        ),
      ),
      onChanged: widget.onChanged,
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\s'))],
    );
  }
}
