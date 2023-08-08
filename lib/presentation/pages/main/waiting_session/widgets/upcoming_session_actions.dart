import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

class UpcomingSessionActions extends StatelessWidget {
  const UpcomingSessionActions({
    super.key,
    required this.onReschedule,
    required this.onCancel,
  });

  final VoidCallback onReschedule;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: ElevatedButton(
            onPressed: onReschedule,
            child: Text(context.l10n.reschedule),
          ),
        ),
        SizedBox(width: 9.w),
        Expanded(
          child: OutlinedButton(
            onPressed: onCancel,
            child: Text(context.l10n.cancel),
          ),
        ),
      ],
    );
  }
}
