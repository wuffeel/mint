import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../theme/mint_text_styles.dart';

class BookingDateCalendar extends StatefulWidget {
  const BookingDateCalendar({
    super.key,
    required this.selectedDay,
    required this.onSelectedChanged,
    required this.onContinue,
    required this.bookingInfo,
  });

  final DateTime? selectedDay;
  final void Function(DateTime) onSelectedChanged;
  final VoidCallback onContinue;
  final SpecialistWorkInfo bookingInfo;

  @override
  State<BookingDateCalendar> createState() => _BookingDateCalendarState();
}

class _BookingDateCalendarState extends State<BookingDateCalendar> {
  DateTime _focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 26.h),
      child: Column(
        children: <Widget>[
          TableCalendar<dynamic>(
            focusedDay: _focusedDay,
            firstDay: now,
            lastDay: DateTime(
              now.year,
              now.month,
              now.day + widget.bookingInfo.bookingDaysAdvance,
            ),
            locale: context.l10n.localeName,
            rangeSelectionMode: RangeSelectionMode.disabled,
            startingDayOfWeek: StartingDayOfWeek.monday,
            pageJumpingEnabled: true,
            selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
            onPageChanged: (focusedDay) => _focusedDay = focusedDay,
            enabledDayPredicate: (day) {
              return !widget.bookingInfo.excludedDays.any(
                    (exclude) =>
                        day.year == exclude.year &&
                        day.month == exclude.month &&
                        day.day == exclude.day,
                  ) &&
                  widget.bookingInfo.workHours.any(
                    (workHour) =>
                        workHour.containsKey(DateFormat('EEEE').format(day)),
                  );
            },
            headerStyle: HeaderStyle(
              titleCentered: true,
              formatButtonVisible: false,
              titleTextFormatter: (date, locale) {
                return DateFormat.MMMM(locale).format(date);
              },
            ),
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(widget.selectedDay, selectedDay)) {
                widget.onSelectedChanged(selectedDay);
                setState(() {
                  _focusedDay = focusedDay;
                });
              }
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
                color: Theme.of(context).hintColor.withOpacity(0.6),
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
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: widget.selectedDay != null ? widget.onContinue : null,
            child: Text(context.l10n.continueStep),
          ),
        ],
      ),
    );
  }
}
