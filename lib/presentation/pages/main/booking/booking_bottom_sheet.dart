import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/booking/widgets/booking_date_calendar.dart';
import 'package:mint/presentation/pages/main/booking/widgets/booking_time_calendar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/dynamic_bottom_sheet_container.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../bloc/booking/booking_bloc.dart';

class BookingBottomSheet extends StatefulWidget {
  const BookingBottomSheet({super.key, required this.specialistModel});

  final SpecialistModel specialistModel;

  @override
  State<BookingBottomSheet> createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  int _currentStep = 0;

  DateTime? _selectedDay;
  DateTime? _selectedTime;

  void _navigateToBookingResume() {
    context.router.pop();
    context.router.push(
      BookingResumeRoute(
        specialistModel: widget.specialistModel,
        date: _selectedDay ?? DateTime.now(),
        time: _selectedTime ?? DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    log('DAY: $_selectedDay');
    log('TIME: $_selectedTime');
    final l10n = context.l10n;
    return DynamicBottomSheetContainer(
      appBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: BottomSheetAppBar(
          title: Text(
            _currentStep == 0
                ? l10n.chooseAvailableDate
                : l10n.chooseAvailableTime,
            style: MintTextStyles.title2,
          ),
        ),
      ),
      child: BlocBuilder<BookingBloc, BookingState>(
        builder: (context, state) {
          if (state is BookingInfoLoading) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: const Center(child: CircularProgressIndicator()),
            );
          }
          if (state is BookingInfoFetchSuccess) {
            return Column(
              children: <Widget>[
                if (_currentStep != 0) ...[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 12.h,
                        horizontal: 16.w,
                      ),
                      child: InkWell(
                        onTap: () => setState(() => _currentStep -= 1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.chevron_left, size: 20.r),
                            Text(
                              context.l10n.previousStep,
                              style: MintTextStyles.caption1,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
                if (_currentStep == 0)
                  BookingDateCalendar(
                    selectedDay: _selectedDay,
                    onSelectedChanged: (day) => setState(() {
                      _selectedDay = day;
                      _selectedTime = null;
                    }),
                    onContinue: () => setState(() => _currentStep = 1),
                    bookingInfo: state.bookingInfo,
                  )
                else if (_currentStep == 1)
                  BookingTimeCalendar(
                    selectedDate: _selectedDay ?? DateTime.now(),
                    selectedTime: _selectedTime,
                    onTimeSelected: (time) =>
                        setState(() => _selectedTime = time),
                    onContinue: _navigateToBookingResume,
                    bookingInfo: state.bookingInfo,
                  ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
