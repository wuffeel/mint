import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mint/gen/assets.gen.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/colors.gen.dart';

class MintBottomNavigation extends StatelessWidget {
  const MintBottomNavigation({super.key, required this.tabsRouter});

  final TabsRouter tabsRouter;

  /// Defines a mapping between [SvgGenImage] assets and their corresponding
  /// labels.
  Map<SvgGenImage, String> _pages(BuildContext context) {
    return {
      Assets.svg.homeIcon: context.l10n.home,
      Assets.svg.specialistsIcon: context.l10n.specialists,
      Assets.svg.sessionsIcon: context.l10n.sessions,
      Assets.svg.chatIcon: context.l10n.chat,
      Assets.svg.profileIcon: context.l10n.profile,
    };
  }

  /// Builds a list of [BottomNavigationBarItem] based on [_pages]
  List<BottomNavigationBarItem> _navigationItems(BuildContext context) {
    final unselectedColor = _unselectedColor(context);
    final selectedColor = _selectedColor(context);

    return _pages(context).entries.map((entry) {
      final asset = entry.key;
      final label = entry.value;
      return BottomNavigationBarItem(
        icon: _BottomBarSvgWidget(asset, color: unselectedColor),
        activeIcon: _BottomBarSvgWidget(asset, color: selectedColor),
        label: label,
      );
    }).toList();
  }

  Color _unselectedColor(BuildContext context) {
    return Theme.of(context).bottomNavigationBarTheme.unselectedItemColor ??
        _getFallbackUnselectedItemColor(context);
  }

  Color _selectedColor(BuildContext context) {
    return Theme.of(context).bottomNavigationBarTheme.selectedItemColor ??
        _getFallbackSelectedItemColor(context);
  }

  Color _getFallbackUnselectedItemColor(BuildContext context) {
    return _isThemeDark(context)
        ? MintColors.greyDark.withOpacity(0.6)
        : MintColors.greyLight.withOpacity(0.6);
  }

  Color _getFallbackSelectedItemColor(BuildContext context) {
    return _isThemeDark(context)
        ? MintColors.primaryDarkBlueColor
        : MintColors.primaryLightBlueColor;
  }

  bool _isThemeDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Theme.of(context).dividerColor)),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: tabsRouter.activeIndex,
        onTap: tabsRouter.setActiveIndex,
        elevation: 0,
        items: _navigationItems(context),
      ),
    );
  }
}

class _BottomBarSvgWidget extends StatelessWidget {
  const _BottomBarSvgWidget(this.asset, {required this.color});

  final SvgGenImage asset;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return asset.svg(
      width: 24,
      height: 24,
      fit: BoxFit.scaleDown,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    );
  }
}
