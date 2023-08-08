import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_alert_dialog.dart';

class ReviewDeleteDialog extends StatelessWidget {
  const ReviewDeleteDialog({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return MintAlertDialog(
      actionTitle: l10n.yes,
      title: Text(l10n.deleteReview),
      content: Text('${context.l10n.doYouWantToDeleteReview}?'),
      onAction: onDelete,
    );
  }
}
