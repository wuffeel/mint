import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/sessions/widgets/toggle_slider.dart';
import 'package:mint/presentation/widgets/upcoming_sessions_list.dart';

@RoutePage()
class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
  late final PageController _pageController;
  final _notifier = ValueNotifier<double>(0);

  double? _currentIndex = 0;
  int _previousPage = 0;

  @override
  void initState() {
    _pageController = PageController()..addListener(_onScroll);
    _previousPage = _pageController.initialPage;
    super.initState();
  }

  void _onScroll() {
    final page = _pageController.page;
    if (page != null) {
      _notifier.value = page - _previousPage;
    }
    log(_notifier.value.toString());
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
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                child: AnimatedBuilder(
                  animation: _notifier,
                  builder: (context, child) => ToggleSlider(
                    currentIndex: _currentIndex,
                    items: [l10n.upcoming, l10n.previous],
                    onItemTap: (index) {
                      setState(() => _currentIndex = index.toDouble());
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    offset: _notifier.value,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) =>
                      setState(() => _currentIndex = page.toDouble()),
                  children: const <Widget>[
                    UpcomingSessionsList(isSliver: false),
                    Placeholder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
