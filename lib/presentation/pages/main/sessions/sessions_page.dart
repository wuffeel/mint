import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/sessions/widgets/toggle_slider.dart';
import 'package:mint/presentation/widgets/upcoming_sessions_list.dart';
import 'package:mint/theme/mint_text_styles.dart';

@RoutePage()
class SessionsPage extends StatefulWidget {
  const SessionsPage({super.key});

  @override
  State<SessionsPage> createState() => _SessionsPageState();
}

class _SessionsPageState extends State<SessionsPage> {
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
                    currentIndex: _currentPage,
                    items: [
                      Text(
                        l10n.upcoming,
                        style: MintTextStyles.title3,
                      ),
                      Text(
                        l10n.previous,
                        style: MintTextStyles.title3,
                      ),
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
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (page) => setState(() => _currentPage = page),
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
