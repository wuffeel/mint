import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/booking_data/booking_data.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/waiting_session/widgets/session_cancellation_dialog.dart';
import 'package:mint/presentation/pages/main/waiting_session/widgets/waiting_session_action_list.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/specialist_booking_tile.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../bloc/booking/booking_bloc.dart';
import '../booking/booking_bottom_sheet.dart';

@RoutePage()
class WaitingSessionPage extends StatelessWidget {
  const WaitingSessionPage({super.key, required this.bookingData});

  final BookingData bookingData;

  String _getNotesString(BuildContext context, String notes) {
    return notes.isNotEmpty ? notes : '${context.l10n.notesWereNotSpecified}.';
  }

  void _showCancellationDialog(BuildContext context) {
    final bookingBloc = context.read<BookingBloc>();
    showDialog<void>(
      context: context,
      builder: (context) => BlocProvider.value(
        value: bookingBloc,
        child: SessionCancellationDialog(
          onCancel: () {
            bookingBloc.add(BookingCancelRequested(bookingData.id));
            context.router.pop();
          },
        ),
      ),
    );
  }

  void _showBookingBottomSheet(BuildContext context) {
    final specialistModel = bookingData.specialistModel;
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useRootNavigator: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<BookingBloc>(),
        child: BookingBottomSheet(
          specialistModel: specialistModel,
          previousBookingData: bookingData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final specialistModel = bookingData.specialistModel;
    final notes = bookingData.notes;
    return Scaffold(
      appBar: const MintAppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SpecialistBookingTile(
                      specialistModel: specialistModel,
                      bookTime: bookingData.bookTime,
                      durationMinutes: bookingData.durationMinutes,
                    ),
                    SizedBox(height: 16.h),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                context.l10n.notesForSession,
                                style: MintTextStyles.headline1,
                              ),
                              SizedBox(height: 8.h),
                              Text(_getNotesString(context, notes)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    WaitingSessionActionList(
                      onChat: () {
                        // TODO(wuffeel): navigate user to chat
                      },
                    ),
                    const Spacer(),
                    SizedBox(height: 20.h),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => _showBookingBottomSheet(context),
                            child: Text(context.l10n.reschedule),
                          ),
                        ),
                        SizedBox(width: 9.w),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => _showCancellationDialog(context),
                            child: Text(context.l10n.cancel),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 26.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}