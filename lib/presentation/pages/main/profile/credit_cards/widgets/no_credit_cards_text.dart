import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/theme/mint_text_styles.dart';

class NoCreditCardsText extends StatelessWidget {
  const NoCreditCardsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: '😔\n',
        style: TextStyle(fontSize: 56.sp),
        children: <InlineSpan>[
          TextSpan(
            text: context.l10n.noPaymentCards,
            style: MintTextStyles.body,
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
