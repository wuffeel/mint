import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/mint_selection_button.dart';

class MintMultiItemSelection extends StatelessWidget {
  const MintMultiItemSelection({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onAdd,
    required this.onRemove,
    this.hasCheckMark = false,
  });

  final List<String> items;
  final List<String> selectedItems;
  final void Function(String) onAdd;
  final void Function(String) onRemove;
  final bool hasCheckMark;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(
        items.length,
        (index) {
          final isSelected = selectedItems.contains(items[index]);
          return MintSelectionButton(
            title: items[index],
            isSelected: isSelected,
            onSelect: () =>
                isSelected ? onRemove(items[index]) : onAdd(items[index]),
            hasCheckMark: hasCheckMark,
          );
        },
      ),
    );
  }
}
