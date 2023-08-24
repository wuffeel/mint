import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:mint/bloc/specialist_online/specialist_online_bloc.dart';
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart';
import 'package:mint/bloc/user/user_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/presentation/pages/main/home/widgets/doctors_online_sliver_list.dart';
import 'package:mint/presentation/pages/main/home/widgets/home_app_bar.dart';
import 'package:mint/presentation/pages/main/home/widgets/pick_up_specialist_button.dart';
import 'package:mint/presentation/widgets/mint_refresh_indicator.dart';
import 'package:mint/presentation/widgets/upcoming_sessions_list.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<SpecialistOnlineBloc>()..add(SpecialistOnlineFetchRequested()),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatefulWidget {
  const _HomePageView();

  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  final _paginationScroll = ScrollController();

  @override
  void initState() {
    super.initState();
    _paginationScroll.addListener(() {
      if (_paginationScroll.position.pixels >
          _paginationScroll.position.maxScrollExtent * 0.8) {
        _loadNextPage(context);
      }
    });
  }

  void _refreshPage(BuildContext context) {
    final specialistRefreshEvent = SpecialistOnlineRefreshRequested();
    context.read<SpecialistOnlineBloc>().add(specialistRefreshEvent);
    context.read<UpcomingSessionsBloc>().add(UpcomingSessionsFetchRequested());
  }

  void _loadNextPage(BuildContext context) {
    context.read<SpecialistOnlineBloc>().add(SpecialistOnlineFetchRequested());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state is UserFetchSuccess ? state.user : null;
        final photo = user?.photoUrl;
        final themeDark = Theme.of(context).brightness == Brightness.dark;
        return Scaffold(
          appBar: HomeAppBar(
            photo: photo,
            firstName: user?.firstName,
            lastName: user?.lastName,
          ),
          body: MintRefreshIndicator(
            onRefresh: () => _refreshPage(context),
            child: CustomScrollView(
              controller: _paginationScroll,
              slivers: <Widget>[
                // Makes StickyHeader unpinned if scrolled to the top of page
                const SliverToBoxAdapter(child: SizedBox(height: 1)),
                UpcomingSessionsList(
                  isSliver: true,
                  isTwoDaysList: true,
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
                ),
                SliverStickyHeader.builder(
                  builder: (context, state) => AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(15.r),
                        bottomRight: Radius.circular(15.r),
                      ),
                      boxShadow: [
                        if (state.isPinned && !themeDark)
                          BoxShadow(
                            offset: const Offset(0, 4),
                            blurRadius: 12.r,
                            color: Colors.black.withOpacity(0.12),
                          ),
                      ],
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
