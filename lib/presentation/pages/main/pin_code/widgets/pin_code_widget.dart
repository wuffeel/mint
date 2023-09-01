import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/pin_code/pin_code_bloc.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pin_code/widgets/pin_code_keyboard.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../backbone/pin_code_status_initial.dart';
import '../../../../widgets/shake_widget.dart';

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({
    super.key,
    required this.length,
    required this.onCompleted,
    this.mainSpacing,
  });

  final int length;

  /// Function that is called when pin-code entered reaches [length]
  final void Function(String) onCompleted;

  final double? mainSpacing;

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  final _shakeWidgetKey = GlobalKey<ShakeWidgetState>();

  /// Current pin-code typed
  String _pinCode = '';

  /// Used for these situations:
  ///
  /// __Set the [_pinCode] to empty string on specific [state]__
  ///
  /// __If pin code thrown a failure => launch pin code shake animation__
  void _pinCodeListener(PinCodeState state) {
    final needsToBeCleared = state is PinCodeEnterSuccess ||
        (state is PinCodeInitial &&
            state.status == PinCodeStatusInitial.changeNew);

    if (state is PinCodeMismatch || state is PinCodeFailure) {
      _shakeWidgetKey.currentState?.shake();
    }

    if (needsToBeCleared && state is! PinCodeConfirmed) {
      _pinCode = '';
    }
  }

  /// Returns a color for obscured PIN, considering whether it typed,
  /// disabled or error
  Color _getPinColor(int index) {
    final theme = Theme.of(context);
    final themeMode = theme.brightness;

    final disabledColor = themeMode == Brightness.dark
        ? MintColors.pinGreyDark
        : MintColors.pinGreyLight;

    return index < _pinCode.length ? theme.primaryColor : disabledColor;
  }

  /// Update current [_pinCode] to [newPinCode]
  ///
  /// Calls [PinCodeWidget.onCompleted] function if [_pinCode] length reaches
  /// [PinCodeWidget.length]
  void _updatePinCode(String newPinCode) {
    setState(() {
      _pinCode = newPinCode;
      if (_pinCode.length == widget.length) {
        widget.onCompleted(_pinCode);
      }
    });
  }

  String _getErrorText(PinCodeState state) {
    if (state is PinCodeMismatch) {
      return context.l10n.enteredPinCodesDoNotMatch;
    } else if (state is PinCodeFailure) {
      return context.l10n.somethingWentWrongTryAgain;
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PinCodeBloc, PinCodeState>(
      listener: (_, state) => _pinCodeListener(state),
      builder: (context, state) {
        final isError = state is PinCodeFailure || state is PinCodeMismatch;
        return Column(
          children: <Widget>[
            ShakeWidget(
              key: _shakeWidgetKey,
              child: Wrap(
                spacing: 6.w,
                children: List.generate(
                  widget.length,
                  (index) => Container(
                    width: 28.w,
                    height: 28.h,
                    alignment: Alignment.center,
                    child: Container(
                      width: 13.w,
                      height: 13.h,
                      decoration: BoxDecoration(
                        color: _getPinColor(index),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (isError) SizedBox(height: 6.h),
            if (state is PinCodeMismatch || state is PinCodeFailure)
              Text(
                _getErrorText(state),
                style: MintTextStyles.caption1.copyWith(
                  color: MintColors.error,
                ),
              ),
            SizedBox(height: isError ? 41.h : 63.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: PinCodeKeyboard(
                onNumTap: (number) {
                  if (_pinCode.length < widget.length) {
                    _updatePinCode('$_pinCode$number');
                  }
                },
                onBackspace: () {
                  if (_pinCode.isNotEmpty) {
                    _updatePinCode(_pinCode.substring(0, _pinCode.length - 1));
                  }
                },
                mainSpacing: 24.w,
              ),
            ),
          ],
        );
      },
    );
  }
}
