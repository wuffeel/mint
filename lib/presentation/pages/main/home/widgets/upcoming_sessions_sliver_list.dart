import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/home/widgets/upcoming_session_container.dart';
import 'package:mint/routes/app_router.gr.dart';

import '../../../../../bloc/upcoming_sessions/upcoming_sessions_bloc.dart';
import '../../../../widgets/loading_indicator.dart';

class UpcomingSessionsSliverList extends StatelessWidget {
  const UpcomingSessionsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingSessionsBloc, UpcomingSessionsState>(
      builder: (context, state) {
        if (state is UpcomingSessionsFetchLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: LoadingIndicator()),
          );
        }
        if (state is UpcomingSessionsFetchSuccess) {
          return SliverPadding(
            padding: EdgeInsets.only(top: 24.h),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => UpcomingSessionContainer(
                onTap: () => context.router.push(
                  WaitingSessionRoute(
                    sessionData: state.upcomingList[index],
                  ),
                ),
                sessionData: state.upcomingList[index],
              ),
              separatorBuilder: (_, __) => SizedBox(height: 10.h),
              itemCount: state.upcomingList.length,
            ),
          );
        }
        return const SliverToBoxAdapter(child: SizedBox.shrink());
      },
    );
  }
}
