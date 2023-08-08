import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:pinput/pinput.dart';

class OtpCodeField extends StatefulWidget {
  const OtpCodeField({
    super.key,
    required this.length,
    required this.controller,
    required this.isError,
    this.onCompleted,
  });

  final int length;
  final TextEditingController controller;
  final void Function(String)? onCompleted;
  final bool isError;

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

    final errorPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: MintColors.error,
          width: 1.w,
        ),
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
      separator: SizedBox(width: 10.w),
      pinAnimationType: PinAnimationType.fade,
      focusedPinTheme: defaultPinTheme,
      cursor: cursor,
      onCompleted: widget.onCompleted,
      errorPinTheme: errorPinTheme,
      forceErrorState: widget.isError,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
    );
  }
}
