import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

class OtpCodeSentText extends StatelessWidget {
  const OtpCodeSentText({super.key, required this.phoneNumber});

  final String phoneNumber;


  /// Returns formatted phone number with spaces based on phone number.
  /// If could not format the given [phoneNumber], returns unformatted.
  ///
  /// For [phoneNumber] with pattern like '+380123456789' will return the
  /// '+380 12 345 6789' formatted string
  String? _formatPhoneNumber(String phoneNumber) {
    return formatAsPhoneNumber(phoneNumber);
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
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
