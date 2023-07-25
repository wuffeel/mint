import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mint/l10n/l10n.dart';

class ReviewDeleteDialog extends StatelessWidget {
  const ReviewDeleteDialog({super.key, required this.onDelete});

  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Theme.of(context).platform == TargetPlatform.android
        ? AlertDialog(
            title: const _DeleteReviewTitle(),
            content: const _DeleteReviewContent(),
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
              ),
            ],
          )
        : CupertinoAlertDialog(
            title: const _DeleteReviewTitle(),
            content: const _DeleteReviewContent(),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: context.router.pop,
                child: Text(l10n.cancel),
              ),
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  onDelete();
                  context.router.pop();
                },
                child: Text(l10n.yes),
              ),
            ],
          );
  }
}

class _DeleteReviewTitle extends StatelessWidget {
  const _DeleteReviewTitle();

  @override
  Widget build(BuildContext context) {
    return Text(context.l10n.deleteReview);
  }
}

class _DeleteReviewContent extends StatelessWidget {
  const _DeleteReviewContent();

  @override
  Widget build(BuildContext context) {
    return Text('${context.l10n.doYouWantToDeleteReview}?');
  }
}
