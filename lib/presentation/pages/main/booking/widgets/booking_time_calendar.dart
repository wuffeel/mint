import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/widgets/mint_single_item_selection.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../gen/assets.gen.dart';

class BookingTimeCalendar extends StatefulWidget {
  const BookingTimeCalendar({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onTimeSelected,
    required this.onContinue,
  });

  final DateTime selectedDate;
  final DateTime? selectedTime;
  final void Function(DateTime) onTimeSelected;
  final VoidCallback onContinue;

  @override
  State<BookingTimeCalendar> createState() => _BookingTimeCalendarState();
}

class _BookingTimeCalendarState extends State<BookingTimeCalendar> {
  late DateTime _selectedTime = widget.selectedTime ?? DateTime.now();

  @override
  void didUpdateWidget(covariant BookingTimeCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedTime = widget.selectedTime ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              l10n.chooseRightTimeToBook,
              style: TextStyle(
                fontSize: 12.sp,
                letterSpacing: 0.03,
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          DecoratedBox(
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
                      DateFormat('dd.MM.yyyy').format(widget.selectedDate),
                      style: MintTextStyles.caption1,
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Align(
            alignment: Alignment.centerLeft,
            child: MintSingleItemSelection(
              items: List.generate(
                10,
                (index) => DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                  DateTime.now().hour,
                  30 * index,
                ),
              ),
              itemTitles: List.generate(
                10,
                (index) => DateFormat.Hm().format(
                  DateTime(
                    DateTime.now().year,
                    DateTime.now().month,
                    DateTime.now().day,
                    DateTime.now().hour,
                    30 * index,
                  ),
                ),
              ),
              selectedItem: _selectedTime,
              onSelect: widget.onTimeSelected,
              mainSpacing: 11.w,
              crossSpacing: 11.h,
              itemInnerPadding: EdgeInsets.symmetric(vertical: 12.5.h),
              itemTextStyle: MintTextStyles.callOut3,
              unselectedTextStyle: MintTextStyles.callOut3.copyWith(
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
              disabledTextStyle: MintTextStyles.callOut3.copyWith(
                color: Theme.of(context).hintColor.withOpacity(0.18),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: widget.onContinue,
            child: Text(l10n.continueStep),
          ),
          SizedBox(height: 26.h),
        ],
      ),
    );
  }
}
