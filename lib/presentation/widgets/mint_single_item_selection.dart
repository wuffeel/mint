import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/widgets/mint_selection_button.dart';

class MintSingleItemSelection<T> extends StatelessWidget {
  const MintSingleItemSelection({
    super.key,
    required this.items,
    required this.itemTitles,
    required this.selectedItem,
    required this.onSelect,
    this.itemsPerRow = 6,
    this.mainSpacing,
    this.crossSpacing,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
  });

  final List<T> items;
  final List<String> itemTitles;
  final T? selectedItem;
  final ValueChanged<T>? onSelect;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;

  /// The number of items to display per row.
  final int itemsPerRow;

  /// The spacing between items horizontally.
  final double? mainSpacing;

  /// The spacing between items vertically.
  final double? crossSpacing;

  /// Calculates the spacing between items dynamically based on the
  /// available width and the desired number of items per row.
  ///
  /// Result spacing can't be greater than [mainSpacing]
  double _calculateSpacing(double maxWidth, int itemsPerRow) {
    final desired = mainSpacing ?? 0;
    final itemWidth = (maxWidth - desired * (itemsPerRow - 1)) / itemsPerRow;

    final spacing = (maxWidth - itemWidth * itemsPerRow) / (itemsPerRow - 1);
    return spacing.clamp(0, desired);
  }

  /// Calculates the width of each item based on the available width and the
  /// spacing between items.
  double _getItemWidth(double maxWidth) {
    final spacing = _calculateSpacing(maxWidth, itemsPerRow);
    return (maxWidth - spacing * (itemsPerRow - 1)) / itemsPerRow;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: _calculateSpacing(constraints.maxWidth, itemsPerRow),
          runSpacing: crossSpacing ?? 8.h,
          children: List.generate(
            items.length,
            (index) {
              final item = items[index];
              return MintSelectionButton(
                value: item,
                title: itemTitles[index],
                isSelected: selectedItem == item,
                onSelect: selectedItem != item ? onSelect : null,
                width: _getItemWidth(constraints.maxWidth),
                itemTextStyle: itemTextStyle,
                itemInnerPadding: itemInnerPadding,
                unselectedTextStyle: unselectedTextStyle,
                disabledTextStyle: disabledTextStyle,
              );
            },
          ),
        );
      },
    );
  }
}
