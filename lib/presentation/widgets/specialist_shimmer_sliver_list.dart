import 'package:flutter/material.dart';
import 'package:mint/presentation/widgets/specialist_card_tile_skeleton.dart';

class SpecialistShimmerSliverList extends StatelessWidget {
  const SpecialistShimmerSliverList({super.key, this.itemCount = 8});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: List.generate(
        itemCount,
        (index) => const SpecialistCardTileSkeleton(),
      ),
    );
  }
}
