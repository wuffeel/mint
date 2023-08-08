import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class BookDateContainer extends StatelessWidget {
  const BookDateContainer({super.key, required this.selectedDate});

  final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return           DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: Row(
        children: <Widget>[
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? MintColors.greyLight
                      : MintColors.timeCalendarSeparatorLight,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Assets.svg.calendarIcon.svg(
                width: 24.w,
                height: 24.h,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).brightness == Brightness.dark
                      ? MintColors.greyDark.withOpacity(0.6)
                      : MintColors.grey1,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                DateFormat.yMd().format(selectedDate),
                style: MintTextStyles.caption1,
              ),
            ),
          )
        ],
      ),
    );
  }
}
