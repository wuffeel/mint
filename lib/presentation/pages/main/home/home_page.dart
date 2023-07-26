import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart';
import 'package:mint/bloc/upcoming_consultations/upcoming_consultations_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/presentation/pages/main/home/widgets/doctors_online_sliver_list.dart';
import 'package:mint/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:mint/presentation/pages/main/home/widgets/pick_up_specialist_button.dart';
import 'package:mint/presentation/pages/main/home/widgets/upcoming_consultations_sliver_list.dart';
import 'package:mint/presentation/widgets/mint_refresh_indicator.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<SpecialistOnlineBloc>()
            ..add(
              SpecialistOnlineFetchRequested(),
            ),
        ),
        BlocProvider(
          create: (context) => getIt<UpcomingConsultationsBloc>()
            ..add(UpcomingConsultationsFetchRequested()),
        )
      ],
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  void _refreshPage(BuildContext context) {
    context.read<SpecialistOnlineBloc>().add(SpecialistOnlineFetchRequested());
    context
        .read<UpcomingConsultationsBloc>()
        .add(UpcomingConsultationsFetchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state is UserFetchSuccess ? state.user : null;
        final photo = user?.photoUrl;
        return Scaffold(
          appBar: HomeAppBar(photo: photo, nameTag: user?.nameTag),
          body: MintRefreshIndicator(
            onRefresh: () => _refreshPage(context),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  sliver: const UpcomingConsultationsSliverList(),
                ),
                SliverStickyHeader(
                  header: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 24.h),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: const PickUpSpecialistButton(),
                        ),
                        SizedBox(height: 24.h),
                      ],
                    ),
                  ),
                  sliver: const DoctorsOnlineSliverList(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
