import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
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

  void _navigateToBookingResume(SpecialistWorkInfo workInfo) {
    context.router.pop();
    context.router.push(
      BookingResumeRoute(
        specialistModel: widget.specialistModel,
        date: _selectedDay ?? DateTime.now(),
        time: _selectedTime ?? DateTime.now(),
        minutesDuration: workInfo.consultationMinutes,
      ),
    );
  }

  void Function()? _onContinue(BookingState state) {
    if (_currentStep == 0) {
      return _selectedDay != null
          ? () => setState(() => _currentStep += 1)
          : null;
    } else if (_currentStep == 1) {
      if (state is BookingInfoFetchSuccess) {
        return _selectedTime != null
            ? () => _navigateToBookingResume(state.bookingInfo)
            : null;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
            return AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOutCubic,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: <Widget>[
                    if (_currentStep != 0) ...[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
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
                        onDaySelected: (day) => setState(() {
                          _selectedDay = day;
                          _selectedTime = null;
                        }),
                        bookingInfo: state.bookingInfo,
                      )
                    else
                      BookingTimeCalendar(
                        selectedDate: _selectedDay ?? DateTime.now(),
                        selectedTime: _selectedTime,
                        onTimeSelected: (time) =>
                            setState(() => _selectedTime = time),
                        bookingInfo: state.bookingInfo,
                      ),
                    SizedBox(height: 20.h),
                    ElevatedButton(
                      onPressed: _onContinue(state),
                      child: Text(l10n.continueStep),
                    ),
                    SizedBox(height: 26.h),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
