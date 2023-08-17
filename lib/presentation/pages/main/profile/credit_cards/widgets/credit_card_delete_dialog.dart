import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../widgets/mint_alert_dialog.dart';

class CreditCardDeleteDialog extends StatelessWidget {
  const CreditCardDeleteDialog({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      title: Text(l10n.deleteCreditCard),
      content: Text('${l10n.doYouWantToDeleteCreditCard}?'),
      actionTitle: l10n.yes,
      onAction: () {
        onDelete();
        context.router.pop();
      },
    );
  }
}
