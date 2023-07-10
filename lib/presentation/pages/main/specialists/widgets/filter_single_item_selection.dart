import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../widgets/mint_selection_button.dart';

class FilterSingleItemSelection extends StatelessWidget {
  const FilterSingleItemSelection({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelect,
  });

  final List<String> items;
  final String? selectedItem;
  final ValueChanged<String?> onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(
        items.length + 1,
        (index) {
          return index == 0
              ? MintSelectionButton(
                  title: 'All',
                  isSelected: selectedItem == null,
                  onSelect: () => onSelect(null),
                )
              : MintSelectionButton(
                  title: items[index - 1],
                  isSelected: selectedItem == items[index - 1],
                  onSelect: () => onSelect(items[index - 1]),
                );
        },
      ),
    );
  }
}
