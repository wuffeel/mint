import 'package:flutter/material.dart';

class OpaqueTabBar extends StatelessWidget implements PreferredSizeWidget {
  const OpaqueTabBar({super.key, required this.tabBar});

  final TabBar tabBar;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }
}
