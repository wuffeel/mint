import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';

class ReviewDeleteDialog extends StatelessWidget {
  const ReviewDeleteDialog({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.deleteReview),
      content: Text('${l10n.doYouWantToDeleteReview}?'),
      actions: [
        TextButton(
          onPressed: context.router.pop,
          child: Text(l10n.cancel),
        ),
        TextButton(
          onPressed: () {
            onDelete();
            context.router.pop();
          },
          child: Text(l10n.yes),
        )
      ],
    );
  }
}
