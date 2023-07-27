import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/domain/entity/upcoming_consultation_data/upcoming_consultation_data.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/waiting_consultation/widgets/waiting_consultation_action_list.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/presentation/widgets/specialist_booking_tile.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class WaitingConsultationPage extends StatelessWidget {
  const WaitingConsultationPage({
    super.key,
    required this.upcomingConsultationData,
  });

  final UpcomingConsultationData upcomingConsultationData;

  String _getNotesString(BuildContext context, String notes) {
    return notes.isNotEmpty ? notes : '${context.l10n.notesWereNotSpecified}.';
  }

  @override
  Widget build(BuildContext context) {
    final specialistModel = upcomingConsultationData.specialistModel;
    final notes = upcomingConsultationData.notes;
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
                      bookTime: upcomingConsultationData.bookTime,
                      durationMinutes: upcomingConsultationData.durationMinutes,
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
                    WaitingConsultationActionList(onChat: () {
                      // TODO(wuffeel): navigate user to chat
                    }),
                    const Spacer(),
                    SizedBox(height: 20.h),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO(wuffeel): add reschedule logic
                            },
                            child: Text(context.l10n.reschedule),
                          ),
                        ),
                        SizedBox(width: 9.w),
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {
                              // TODO(wuffeel): dialog booking cancel
                            },
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
