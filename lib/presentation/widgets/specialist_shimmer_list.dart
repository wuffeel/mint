import 'package:flutter/material.dart';
import 'package:mint/presentation/widgets/specialist_card_tile_skeleton.dart';

class SpecialistShimmerList extends StatelessWidget {
  const SpecialistShimmerList({super.key, this.itemCount = 5});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => const SpecialistCardTileSkeleton(),
      ),
    );
  }
}
