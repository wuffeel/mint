import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/home/widgets/upcoming_session_container.dart';
import 'package:mint/routes/app_router.gr.dart';

import '../../bloc/upcoming_sessions/upcoming_sessions_bloc.dart';
import 'loading_indicator.dart';

class UpcomingSessionsList extends StatelessWidget {
  const UpcomingSessionsList({
    super.key,
    required this.isSliver,
    this.isTwoDaysList = false,
    this.padding,
  });

  final bool isSliver;
  final EdgeInsetsGeometry? padding;

  /// Identifies whether to show the entire upcoming list or only bookings
  /// within the next two days.
  final bool isTwoDaysList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingSessionsBloc, UpcomingSessionsState>(
      builder: (context, state) {
        if (state is UpcomingSessionsFetchLoading) {
          return isSliver
              ? const SliverToBoxAdapter(
                  child: Center(child: LoadingIndicator()),
                )
              : const Center(child: LoadingIndicator());
        } else if (state is UpcomingSessionsFetchSuccess) {
          final sessionsList =
              isTwoDaysList ? state.twoDaysList : state.upcomingList;
          final itemCount = sessionsList.length;

          if (itemCount == 0) {
            return isSliver
                ? const SliverToBoxAdapter(child: SizedBox.shrink())
                : const SizedBox.shrink();
          }

          Widget buildUpcomingSession(int index) {
            return UpcomingSessionContainer(
              onTap: () => context.router.push(
                SessionDetailsRoute(bookingData: sessionsList[index]),
              ),
              bookingData: sessionsList[index],
            );
          }

          final separator = SizedBox(height: 10.h);

          return isSliver
              ? SliverPadding(
                  padding: padding ?? EdgeInsets.zero,
                  sliver: SliverList.separated(
                    itemBuilder: (context, index) =>
                        buildUpcomingSession(index),
                    separatorBuilder: (_, __) => separator,
                    itemCount: itemCount,
                  ),
                )
              : ListView.separated(
                  itemBuilder: (context, index) => buildUpcomingSession(index),
                  separatorBuilder: (_, __) => separator,
                  itemCount: itemCount,
                  padding: padding,
                );
        } else {
          return isSliver
              ? const SliverToBoxAdapter(child: SizedBox.shrink())
              : const SizedBox.shrink();
        }
      },
    );
  }
}
