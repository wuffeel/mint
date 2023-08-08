import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';

class SessionCancellationDialog extends StatelessWidget {
  const SessionCancellationDialog({super.key, required this.onCancel});

  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      actionTitle: l10n.yes,
      title: Text(l10n.sessionCancellation),
      content: Text('${l10n.areYouSureToCancelMeeting}?'),
      onAction: onCancel,
    );
  }
}
