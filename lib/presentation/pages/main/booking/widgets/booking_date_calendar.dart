import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/utils/calendar_utils.dart';
import 'package:mint_core/mint_core.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../theme/mint_text_styles.dart';

class BookingDateCalendar extends StatefulWidget {
  const BookingDateCalendar({
    super.key,
    required this.selectedDay,
    required this.onDaySelected,
    required this.bookingInfo,
  });

  final DateTime? selectedDay;
  final void Function(DateTime) onDaySelected;
  final SpecialistWorkInfo bookingInfo;

  @override
  State<BookingDateCalendar> createState() => _BookingDateCalendarState();
}

class _BookingDateCalendarState extends State<BookingDateCalendar> {
  final _currentDate = DateTime.now();
  late DateTime _focusedDay = _currentDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar<dynamic>(
      focusedDay: _focusedDay,
      firstDay: DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day,
      ),
      lastDay: DateTime(
        _currentDate.year,
        _currentDate.month,
        _currentDate.day + widget.bookingInfo.bookingDaysAdvance,
      ),
      locale: context.l10n.localeName,
      rangeSelectionMode: RangeSelectionMode.disabled,
      startingDayOfWeek: StartingDayOfWeek.monday,
      pageJumpingEnabled: true,
      selectedDayPredicate: (day) => isSameDay(widget.selectedDay, day),
      onPageChanged: (focusedDay) => _focusedDay = focusedDay,
      enabledDayPredicate: (day) {
        final weekday = DateFormat('EEEE').format(day);
        final workHours = widget.bookingInfo.workHours;
        return workHours.containsKey(weekday) &&
            !widget.bookingInfo.excludedDays.any(
              (exclude) => isSameDay(exclude, day),
            ) &&
            !CalendarUtils.isWorkTimeEnd(day, workHours[weekday]?.last) &&
            !CalendarUtils.isDayFullyBooked(
              day,
              widget.bookingInfo.bookedTimes,
              workHours[weekday] ?? <DateTime>[],
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
          widget.onDaySelected(selectedDay);
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
    );
  }
}
