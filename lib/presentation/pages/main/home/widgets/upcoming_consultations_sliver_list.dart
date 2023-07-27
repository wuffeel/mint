import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/home/widgets/upcoming_consultation_container.dart';
import 'package:mint/routes/app_router.gr.dart';

import '../../../../../bloc/upcoming_consultations/upcoming_consultations_bloc.dart';
import '../../../../widgets/loading_indicator.dart';

class UpcomingConsultationsSliverList extends StatelessWidget {
  const UpcomingConsultationsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpcomingConsultationsBloc, UpcomingConsultationsState>(
      builder: (context, state) {
        if (state is UpcomingConsultationsFetchLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: LoadingIndicator()),
          );
        }
        if (state is UpcomingConsultationsFetchSuccess) {
          return SliverPadding(
            padding: EdgeInsets.only(top: 24.h),
            sliver: SliverList.separated(
              itemBuilder: (context, index) => UpcomingConsultationContainer(
                onTap: () => context.router.push(
                  WaitingConsultationRoute(
                    upcomingConsultationData: state.upcomingList[index],
                  ),
                ),
                upcomingConsultationData: state.upcomingList[index],
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
