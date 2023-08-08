import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/mint_selection_button.dart';

class MintMultiItemSelection<T> extends StatelessWidget {
  const MintMultiItemSelection({
    super.key,
    required this.items,
    required this.itemTitles,
    required this.selectedItems,
    required this.onItemSelected,
    this.hasCheckMark = false,
    this.itemAlignment,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
    this.itemWidth,
  });

  final List<T> items;
  final List<String> itemTitles;
  final List<T> selectedItems;
  final void Function(List<T>?) onItemSelected;
  final bool hasCheckMark;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? itemWidth;

  List<T>? _updateList(T item, bool isSelected) {
    final updated = isSelected
        ? ([...selectedItems]..remove(item))
        : [...selectedItems, item];
    return updated.isNotEmpty ? updated : null;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Wrap(
        spacing: 8.w,
        runSpacing: 8.h,
        children: List.generate(
          items.length,
          (index) {
            final isSelected = selectedItems.contains(items[index]);
            return MintSelectionButton(
              value: items[index],
              title: itemTitles[index],
              isSelected: isSelected,
              onSelect: (item) => onItemSelected(_updateList(item, isSelected)),
              hasCheckMark: hasCheckMark,
              itemInnerPadding: itemInnerPadding,
              itemTextStyle: itemTextStyle,
              unselectedTextStyle: unselectedTextStyle,
              disabledTextStyle: disabledTextStyle,
              width: itemWidth,
            );
          },
        ),
      ),
    );
  }
}
