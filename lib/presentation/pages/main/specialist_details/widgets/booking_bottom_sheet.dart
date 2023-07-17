import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/dynamic_bottom_sheet_container.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:table_calendar/table_calendar.dart';

class BookingBottomSheet extends StatelessWidget {
  const BookingBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return DynamicBottomSheetContainer(
      appBar: BottomSheetAppBar(
        title: Text(
          'Choose an available date',
          style: MintTextStyles.title2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        child: TableCalendar(
          focusedDay: now,
          firstDay: now,
          lastDay: DateTime(
            now.year,
            now.month,
            now.day + 7,
          ),
        ),
      ),
    );
  }
}
