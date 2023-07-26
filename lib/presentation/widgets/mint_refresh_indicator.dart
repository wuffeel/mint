import 'package:flutter/material.dart';

class MintRefreshIndicator extends StatelessWidget {
  const MintRefreshIndicator({
    super.key,
    required this.child,
    required this.onRefresh,
  });

  final Widget child;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      color: Theme.of(context).colorScheme.primary,
      onRefresh: () {
        onRefresh();
        return Future<void>.delayed(
          const Duration(milliseconds: 300),
        );
      },
      child: child,
    );
  }
}
