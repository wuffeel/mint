import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

class EnterPhoneSignInText extends StatelessWidget {
  const EnterPhoneSignInText({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '${l10n.alreadyHaveAnAccount}?',
            style: MintTextStyles.footnote,
          ),
          TextSpan(text: ' ', style: MintTextStyles.footnote),
          TextSpan(
            text: l10n.clickSignIn,
            style: MintTextStyles.footnote.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
