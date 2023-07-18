import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../theme/mint_text_styles.dart';

class BookingDateCalendar extends StatefulWidget {
  const BookingDateCalendar({
    super.key,
    required this.selectedDay,
    required this.onSelectedChanged,
    required this.onContinue,
  });

  final DateTime? selectedDay;
  final void Function(DateTime) onSelectedChanged;
  final VoidCallback onContinue;

  @override
  State<BookingDateCalendar> createState() => _BookingDateCalendarState();
}

class _BookingDateCalendarState extends State<BookingDateCalendar> {
  late DateTime? _selectedDay = widget.selectedDay;
  DateTime _focusedDay = DateTime.now();

  @override
  void didUpdateWidget(covariant BookingDateCalendar oldWidget) {
    super.didUpdateWidget(oldWidget);
    _selectedDay = widget.selectedDay;
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Padding(
      padding: EdgeInsets.only(
        left: 16.w,
        right: 16.w,
        bottom: 26.h,
      ),
      child: Column(
        children: <Widget>[
          TableCalendar<dynamic>(
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextFormatter: (date, locale) {
                return DateFormat.MMMM(locale).format(date);
              },
            ),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {
                // Call `setState()` when updating the selected day
                widget.onSelectedChanged(selectedDay);
                setState(() {
                  _focusedDay = focusedDay;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            calendarStyle: CalendarStyle(
              isTodayHighlighted: false,
              defaultTextStyle: MintTextStyles.figure,
              selectedTextStyle: MintTextStyles.figure,
              selectedDecoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                ),
                shape: BoxShape.circle,
              ),
              disabledTextStyle: MintTextStyles.figure.copyWith(
                color: Theme.of(context).hintColor.withOpacity(0.18),
              ),
              outsideTextStyle: MintTextStyles.figure.copyWith(
                color: Theme.of(context).hintColor.withOpacity(0.8),
              ),
              weekendTextStyle: MintTextStyles.figure,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
              weekendStyle: TextStyle(
                fontSize: 16.sp,
                color: Theme.of(context).hintColor.withOpacity(0.6),
              ),
            ),
            rangeSelectionMode: RangeSelectionMode.disabled,
            locale: context.l10n.localeName,
            focusedDay: _focusedDay,
            firstDay: now,
            lastDay: DateTime(
              now.year,
              now.month,
              now.day + 28,
            ),
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: widget.onContinue,
            child: Text(context.l10n.continueStep),
          ),
        ],
      ),
    );
  }
}
