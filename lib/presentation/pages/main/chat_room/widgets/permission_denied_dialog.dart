import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';

class PermissionDeniedDialog extends StatelessWidget {
  const PermissionDeniedDialog({super.key, required this.onAction});

  final VoidCallback onAction;
  
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      isDestructiveAction: false,
      title: Text(l10n.permissionDeniedTitle),
      content: Text(l10n.permissionDeniedContent),
      actionTitle: l10n.goToSettings,
      onAction: onAction,
    );
  }
}
