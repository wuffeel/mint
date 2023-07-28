import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../bloc/previous_sessions/previous_sessions_bloc.dart';
import '../../../../../routes/app_router.gr.dart';
import '../../home/widgets/upcoming_session_container.dart';

class PreviousSessionsList extends StatelessWidget {
  const PreviousSessionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PreviousSessionsBloc, PreviousSessionsState>(
      builder: (context, state) {
        if (state is PreviousSessionsFetchLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is PreviousSessionsFetchSuccess) {
          final sessionsList = state.previousList;

          return ListView.separated(
            itemCount: sessionsList.length,
            separatorBuilder: (_, __) => SizedBox(height: 10.h),
            itemBuilder: (context, index) => UpcomingSessionContainer(
              onTap: () => context.router.push(
                WaitingSessionRoute(
                  bookingData: sessionsList[index],
                ),
              ),
              bookingData: sessionsList[index],
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
