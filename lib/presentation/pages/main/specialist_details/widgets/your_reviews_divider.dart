import 'package:flutter/material.dart';

class YourReviewsDivider extends StatelessWidget {
  const YourReviewsDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Divider(
        height: 1,
        thickness: 2,
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
