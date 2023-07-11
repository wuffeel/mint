import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

class EnterPhoneTermsText extends StatelessWidget {
  const EnterPhoneTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: l10n.byTappingSignUp,
            style: MintTextStyles.caption1.copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
          ),
          TextSpan(
            text: ' ',
            style: MintTextStyles.caption1,
          ),
          TextSpan(
            text: l10n.mindyTermsAndPrivacy,
            style: MintTextStyles.caption1,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // TODO(wuffeel): terms won't be shown
              },
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
