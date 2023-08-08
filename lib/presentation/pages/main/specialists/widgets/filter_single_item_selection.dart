import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../widgets/mint_selection_button.dart';

class FilterSingleItemSelection<T> extends StatelessWidget {
  const FilterSingleItemSelection({
    super.key,
    required this.items,
    required this.itemTitles,
    required this.selectedItem,
    required this.onSelect,
    this.itemInnerPadding,
  });

  final List<T> items;
  final List<String> itemTitles;
  final T? selectedItem;
  final ValueChanged<T?> onSelect;
  final EdgeInsetsGeometry? itemInnerPadding;

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
                  value: null,
                  title: context.l10n.allFilter,
                  isSelected: selectedItem == null,
                  onSelect: onSelect,
                  itemInnerPadding: itemInnerPadding,
                )
              : MintSelectionButton(
                  value: items[index - 1],
                  title: itemTitles[index - 1],
                  isSelected: selectedItem == items[index - 1],
                  onSelect: selectedItem != items[index - 1] ? onSelect : null,
                  itemInnerPadding: itemInnerPadding,
                );
        },
      ),
    );
  }
}
