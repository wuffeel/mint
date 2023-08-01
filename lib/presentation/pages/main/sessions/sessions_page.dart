import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/previous_sessions/previous_sessions_bloc.dart';
import 'package:mint/bloc/upcoming_sessions/upcoming_sessions_bloc.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/sessions/widgets/previous_sessions_list.dart';
import 'package:mint/presentation/pages/main/sessions/widgets/toggle_slider.dart';
import 'package:mint/presentation/widgets/mint_refresh_indicator.dart';
import 'package:mint/presentation/widgets/upcoming_sessions_list.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class SessionsPage extends StatelessWidget {
  const SessionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PreviousSessionsBloc>()..add(PreviousSessionsFetchRequested()),
      child: const _SessionsView(),
    );
  }
}

class _SessionsView extends StatefulWidget {
  const _SessionsView();

  @override
  State<_SessionsView> createState() => _SessionsViewState();
}

class _SessionsViewState extends State<_SessionsView> {
  late final PageController _pageController;
  final _notifier = ValueNotifier<double>(0);

  int _currentPage = 0;

  @override
  void initState() {
    _pageController = PageController()..addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    final page = _pageController.page;
    if (page != null) _notifier.value = page;
  }

  void _onSessionsRefresh() {
    context.read<UpcomingSessionsBloc>().add(UpcomingSessionsFetchRequested());
    context.read<PreviousSessionsBloc>().add(PreviousSessionsFetchRequested());
  }

  @override
  void dispose() {
    _notifier.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 16.h),
            AnimatedBuilder(
              animation: _notifier,
              builder: (context, child) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: ToggleSlider(
                  currentIndex: _currentPage,
                  items: [
                    Text(l10n.upcoming, style: MintTextStyles.title3),
                    Text(l10n.previous, style: MintTextStyles.title3),
                  ],
                  onItemTap: (index) {
                    setState(() => _currentPage = index);
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.linear,
                    );
                  },
                  offset: _notifier.value,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) => setState(
                    () => _currentPage = page,
                  ),
                  children: <Widget>[
                    MintRefreshIndicator(
                      onRefresh: _onSessionsRefresh,
                      child: UpcomingSessionsList(
                        isSliver: false,
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                    ),
                    MintRefreshIndicator(
                      onRefresh: _onSessionsRefresh,
                      child: PreviousSessionsList(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
