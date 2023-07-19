import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_single_button.dart';

class PickUpRadioButtonList<T> extends StatelessWidget {
  const PickUpRadioButtonList({
    super.key,
    required this.items,
    required this.itemTitles,
    required this.selectedItem,
    required this.onSelect,
  });

  final List<T> items;
  final List<String> itemTitles;
  final T? selectedItem;
  final ValueChanged<T?> onSelect;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => PickUpSingleButton(
        title: itemTitles[index],
        value: items[index],
        onSelect: onSelect,
        isSelected: selectedItem == items[index],
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 8.h,
      ),
      itemCount: items.length,
    );
  }
}
