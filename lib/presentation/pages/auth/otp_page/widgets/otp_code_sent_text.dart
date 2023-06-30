import 'package:flutter/material.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

class OtpCodeSentText extends StatelessWidget {
  const OtpCodeSentText({super.key, required this.phoneNumber});

  final String phoneNumber;

  /// For [phoneNumber] with pattern like '+380123456789' will return the
  /// '+380 12 345 67 89' formatted string
  String _formatPhoneNumber(String phoneNumber) {
    return formatNumberSync(phoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: l10n.theCodeWasSentTo,
            style: MintTextStyles.caption1,
          ),
          TextSpan(text: ' ', style: MintTextStyles.caption1),
          TextSpan(
            text: _formatPhoneNumber(phoneNumber),
            style: MintTextStyles.captionSemiBold.copyWith(
              color: MintColors.primaryBlueColor,
            ),
          ),
        ],
      ),
    );
  }
}
