import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/entity/specialist_work_info/specialist_work_info.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/booking/widgets/booking_date_calendar.dart';
import 'package:mint/presentation/pages/main/booking/widgets/booking_time_calendar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_app_bar.dart';
import 'package:mint/presentation/widgets/bottom_sheet_dynamic_container.dart';
import 'package:mint/presentation/widgets/no_items_found.dart';
import 'package:mint/routes/app_router.gr.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../bloc/booking/booking_bloc.dart';

class BookingBottomSheet extends StatefulWidget {
  const BookingBottomSheet({
    super.key,
    required this.specialistModel,
    this.previousBookingData,
  });

  final SpecialistModel specialistModel;

  /// Provided if reschedule is required
  final BookingData? previousBookingData;

  @override
  State<BookingBottomSheet> createState() => _BookingBottomSheetState();
}

class _BookingBottomSheetState extends State<BookingBottomSheet> {
  int _currentStep = 0;

  DateTime? _selectedDay;
  DateTime? _selectedTime;

  @override
  void initState() {
    super.initState();
    context
        .read<BookingBloc>()
        .add(BookingWorkInfoRequested(widget.specialistModel.id));
  }

  void _navigateToBookingResume(SpecialistWorkInfo workInfo) {
    context.router.pop();
    final selectedDate = _selectedDay ?? DateTime.now();
    final selectedTime = _selectedTime ?? DateTime.now();
    final bookTime = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      selectedTime.hour,
      selectedTime.minute,
      selectedTime.second,
    );
    final bookingResumeRoute = BookingResumeRoute(
      specialistModel: widget.specialistModel,
      bookTime: bookTime,
      durationMinutes: workInfo.consultationMinutes,
      previousBookingData: widget.previousBookingData,
    );
    widget.previousBookingData == null
        ? context.router.push(
            CheckoutWrapperRoute(children: [bookingResumeRoute]),
          )
        : context.router.push(bookingResumeRoute);
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
    return BottomSheetDynamicContainer(
      appBar: BottomSheetAppBar(
        title: Text(
          _currentStep == 0
              ? l10n.chooseAvailableDate
              : l10n.chooseAvailableTime,
          style: MintTextStyles.title2,
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
          if (state is BookingInfoFetchFailure) {
            return SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.6,
              child: Center(
                child: NoItemsFound(title: '${l10n.noBookingInfoFound}!'),
              ),
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
                        onChangeDate: () => setState(() => _currentStep = 0),
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
