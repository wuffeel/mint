import 'package:flutter/material.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';

class ErrorAlertDialog extends StatelessWidget {
  const ErrorAlertDialog({
    super.key,
    required this.actionTitle,
    required this.onAction,
    this.title,
    this.content,
  });

  final String actionTitle;
  final VoidCallback onAction;
  final Widget? title;
  final Widget? content;

  @override
  Widget build(BuildContext context) {
    return MintAlertDialog(
      actionTitle: actionTitle,
      title: title,
      content: content,
      isDestructiveAction: false,
      hasCancelButton: false,
      onAction: onAction,
    );
  }
}
