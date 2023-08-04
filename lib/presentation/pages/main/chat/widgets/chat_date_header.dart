import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../theme/mint_text_styles.dart';

class ChatDateHeader extends StatelessWidget {
  const ChatDateHeader({super.key, required this.date, required this.text});

  final DateTime date;
  final String text;

  bool _isSameDay() {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  @override
  Widget build(BuildContext context) {
    return _isSameDay()
        ? Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 32, top: 16),
            child: Text(
              context.l10n.today,
              style: MintTextStyles.footnoteSemiBold,
            ),
          )
        : Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 32, top: 16),
            child: Text(
              text,
              style: MintTextStyles.footnoteSemiBold,
            ),
          );
  }
}
