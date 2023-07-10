import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PickUpMultiItemSelection extends StatelessWidget {
  const PickUpMultiItemSelection({
    super.key,
    required this.items,
    required this.selectedItems,
    required this.onAdd,
    required this.onRemove,
  });

  final List<String> items;
  final List<String> selectedItems;
  final void Function(String) onAdd;
  final void Function(String) onRemove;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: List.generate(
        items.length,
        (index) {
          final isSelected = selectedItems.contains(items[index]);
          return InkWell(
            onTap: () =>
                isSelected ? onRemove(items[index]) : onAdd(items[index]),
            borderRadius: BorderRadius.circular(10.r),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(10.r),
                border: isSelected
                    ? Border.all(
                        color: Theme.of(context).colorScheme.primary,
                        strokeAlign: BorderSide.strokeAlignOutside,
                      )
                    : null,
              ),
              child: Text(
                items[index],
                style: TextStyle(
                  fontSize: 16.sp,
                  height: 1.3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
