import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/booking/widgets/book_date_container.dart';
import 'package:mint/presentation/widgets/mint_single_item_selection.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint/utils/calendar_utils.dart';

class BookingTimeCalendar extends StatefulWidget {
  const BookingTimeCalendar({
    super.key,
    required this.selectedDate,
    required this.selectedTime,
    required this.onTimeSelected,
    required this.bookingInfo,
  });

  final DateTime selectedDate;
  final DateTime? selectedTime;
  final void Function(DateTime) onTimeSelected;
  final SpecialistWorkInfo bookingInfo;

  @override
  State<BookingTimeCalendar> createState() => _BookingTimeCalendarState();
}

class _BookingTimeCalendarState extends State<BookingTimeCalendar> {
  /// String representation of selectedDate weekday, e.g. 'Monday'
  late final _selectedDay = DateFormat('EEEE').format(widget.selectedDate);

  /// List of work hours for [_selectedDay]
  late final _workHours =
      widget.bookingInfo.workHours[_selectedDay] ?? <DateTime>[];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Column(
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
        BookDateContainer(selectedDate: widget.selectedDate),
        SizedBox(height: 20.h),
        Align(
          alignment: Alignment.centerLeft,
          child: MintSingleItemSelection(
            items: _workHours,
            itemTitles: List.generate(
              _workHours.length,
              (index) => DateFormat.Hm().format(_workHours[index]),
            ),
            selectedItem: widget.selectedTime,
            onSelect: widget.onTimeSelected,
            isItemDisabled: (time) => CalendarUtils.isTimeUnavailable(
              time,
              widget.selectedDate,
              widget.bookingInfo.bookedTimes,
            ),
            mainSpacing: 11.w,
            crossSpacing: 11.h,
            itemInnerPadding: EdgeInsets.symmetric(vertical: 12.5.h),
            itemAlignment: Alignment.center,
            itemsPerRow: 6,
            itemTextStyle: MintTextStyles.callOut3,
            unselectedTextStyle: MintTextStyles.callOut3.copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.6),
            ),
            disabledTextStyle: MintTextStyles.callOut3.copyWith(
              color: Theme.of(context).hintColor.withOpacity(0.18),
            ),
          ),
        ),
      ],
    );
  }
}
