import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class BookingResumeDetails extends StatelessWidget {
  const BookingResumeDetails({
    super.key,
    required this.date,
    required this.time,
    required this.minutesDuration,
  });

  final DateTime date;
  final DateTime time;
  final int minutesDuration;

  Color _getTimeDataTextColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.greyDark.withOpacity(0.6)
        : MintColors.quarternary1;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${l10n.date}:', style: MintTextStyles.callOut),
                Text(
                  DateFormat.yMd(context.l10n.localeName).format(date),
                  style: MintTextStyles.body.copyWith(
                    color: _getTimeDataTextColor(context),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Divider(height: 1, thickness: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${l10n.time}:', style: MintTextStyles.callOut),
                Text(
                  DateFormat.Hm().format(time),
                  style: MintTextStyles.body.copyWith(
                    color: _getTimeDataTextColor(context),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.h),
              child: const Divider(height: 1, thickness: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${l10n.duration}:', style: MintTextStyles.callOut),
                Text(
                  l10n.upToNMin(minutesDuration),
                  style: MintTextStyles.body.copyWith(
                    color: _getTimeDataTextColor(context),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
