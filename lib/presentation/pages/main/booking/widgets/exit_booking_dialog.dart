import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';

class ExitBookingDialog extends StatelessWidget {
  const ExitBookingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      actionTitle: l10n.yes,
      title: Text(l10n.exitBookingTitle),
      content: Text('${l10n.doYouWantToExitBooking}?'),
      isDestructiveAction: false,
      onAction: () => context.router.pop(true),
    );
  }
}
