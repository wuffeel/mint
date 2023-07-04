import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/gen/colors.gen.dart';
import 'package:mint/l10n/l10n.dart';

class MintBottomNavigation extends StatelessWidget {
  const MintBottomNavigation({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  List<BottomNavigationBarItem> _items(BuildContext context) {
    final unselectedColor =
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor;
    final selectedColor =
        Theme.of(context).bottomNavigationBarTheme.selectedItemColor;
    if (selectedColor == null || unselectedColor == null) return [];

    return <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Assets.svg.homeIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
        ),
        activeIcon: Assets.svg.homeIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
        ),
        label: context.l10n.home,
      ),
      BottomNavigationBarItem(
        icon: Assets.svg.specialistsIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
        ),
        activeIcon: Assets.svg.specialistsIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
        ),
        label: context.l10n.specialists,
      ),
      BottomNavigationBarItem(
        icon: Assets.svg.sessionsIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
        ),
        activeIcon: Assets.svg.sessionsIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
        ),
        label: context.l10n.sessions,
      ),
      BottomNavigationBarItem(
        icon: Assets.svg.profileIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(unselectedColor, BlendMode.srcIn),
        ),
        activeIcon: Assets.svg.profileIcon.svg(
          width: 24,
          height: 24,
          fit: BoxFit.scaleDown,
          colorFilter: ColorFilter.mode(selectedColor, BlendMode.srcIn),
        ),
        label: context.l10n.profile,
      ),
    ];
  }

  Color _getTopBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.separatorDark
        : MintColors.separatorLight;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: use_decorated_box
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: _getTopBorderColor(context),)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        elevation: 0,
        items: _items(context),
      ),
    );
  }
}
