import 'package:flutter/material.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key, this.onRefresh, this.size = 32, this.color});

  final VoidCallback? onRefresh;
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onRefresh,
      child: Icon(
        Icons.refresh,
        color: color ?? Theme.of(context).colorScheme.primary,
        size: size,
      ),
    );
  }
}
