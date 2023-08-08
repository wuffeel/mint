import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';

class MintAlertDialog extends StatelessWidget {
  const MintAlertDialog({
    super.key,
    required this.actionTitle,
    this.isDestructiveAction = true,
    this.hasCancelButton = true,
    this.title,
    this.content,
    this.onAction,
    this.cancelButtonTitle,
  });

  final String actionTitle;
  final bool isDestructiveAction;
  final Widget? title;
  final Widget? content;
  final VoidCallback? onAction;
  final bool hasCancelButton;
  final String? cancelButtonTitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Theme.of(context).platform == TargetPlatform.android
        ? AlertDialog(
            title: title,
            content: content,
            actions: [
              if (hasCancelButton) TextButton(
                onPressed: () => context.router.pop(false),
                child: Text(cancelButtonTitle ?? l10n.cancel),
              ),
              TextButton(
                onPressed: onAction,
                child: Text(actionTitle),
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: title,
            content: content,
            actions: [
              if (hasCancelButton) CupertinoDialogAction(
                onPressed: () => context.router.pop(false),
                child: Text(cancelButtonTitle ?? l10n.cancel),
              ),
              CupertinoDialogAction(
                isDestructiveAction: isDestructiveAction,
                onPressed: onAction,
                child: Text(actionTitle),
              ),
            ],
          );
  }
}
