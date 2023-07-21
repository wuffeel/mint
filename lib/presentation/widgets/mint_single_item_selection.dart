import 'package:flutter/material.dart';
import 'package:mint/presentation/widgets/mint_selection_button.dart';

class MintSingleItemSelection<T> extends StatelessWidget {
  const MintSingleItemSelection({
    super.key,
    required this.items,
    required this.itemTitles,
    required this.selectedItem,
    required this.onSelect,
    this.isItemDisabled,
    this.itemsPerRow,
    this.mainSpacing,
    this.crossSpacing,
    this.itemAlignment,
    this.itemInnerPadding,
    this.itemTextStyle,
    this.unselectedTextStyle,
    this.disabledTextStyle,
    this.itemWidth,
  });

  final List<T> items;
  final List<String> itemTitles;
  final T? selectedItem;
  final ValueChanged<T>? onSelect;
  final bool Function(T)? isItemDisabled;
  final AlignmentGeometry? itemAlignment;
  final EdgeInsetsGeometry? itemInnerPadding;
  final TextStyle? itemTextStyle;
  final TextStyle? unselectedTextStyle;
  final TextStyle? disabledTextStyle;
  final double? itemWidth;

  /// The number of items to display per row.
  final int? itemsPerRow;

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
  double _getItemWidth(double maxWidth, int itemsPerRow) {
    final spacing = _calculateSpacing(maxWidth, itemsPerRow);
    return (maxWidth - spacing * (itemsPerRow - 1)) / itemsPerRow;
  }

  bool _isCellDisabled(T value) {
    final isDisabled = isItemDisabled;
    return isDisabled != null && isDisabled(value);
  }

  @override
  Widget build(BuildContext context) {
    final perRow = itemsPerRow;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: perRow != null
              ? _calculateSpacing(constraints.maxWidth, perRow)
              : mainSpacing ?? 0,
          runSpacing: crossSpacing ?? 0,
          children: List.generate(
            items.length,
            (index) {
              final item = items[index];
              return MintSelectionButton(
                value: item,
                title: itemTitles[index],
                isSelected: selectedItem == item,
                onSelect: selectedItem != item ? onSelect : null,
                isDisabled: _isCellDisabled(item),
                width: perRow != null
                    ? _getItemWidth(constraints.maxWidth, perRow)
                    : itemWidth,
                itemTextStyle: itemTextStyle,
                itemAlignment: itemAlignment,
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
