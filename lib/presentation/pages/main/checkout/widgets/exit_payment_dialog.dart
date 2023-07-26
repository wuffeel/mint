import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';

class ExitPaymentDialog extends StatelessWidget {
  const ExitPaymentDialog({super.key, required this.onExit});

  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      actionTitle: l10n.yes,
      title: Text(l10n.exitPaymentTitle),
      content: Text('${l10n.doYouWantCancelPayment}?'),
      onAction: onExit,
    );
  }
}
