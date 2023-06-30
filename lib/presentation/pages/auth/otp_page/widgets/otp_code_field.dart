import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:pinput/pinput.dart';

class OtpCodeField extends StatefulWidget {
  const OtpCodeField({
    super.key,
    required this.length,
    required this.controller,
  });

  final int length;
  final TextEditingController controller;

  @override
  State<OtpCodeField> createState() => _OtpCodeFieldState();
}

class _OtpCodeFieldState extends State<OtpCodeField> {
  final _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 57.h,
      textStyle: MintTextStyles.title1,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.r),
      ),
    );

    final cursor = Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: 24.w,
        height: 1.h,
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );

    return Pinput(
      length: widget.length,
      controller: widget.controller,
      focusNode: _focusNode,
      defaultPinTheme: defaultPinTheme,
      separator: const SizedBox(width: 16),
      pinAnimationType: PinAnimationType.fade,
      focusedPinTheme: defaultPinTheme,
      cursor: cursor,
    );
  }
}
