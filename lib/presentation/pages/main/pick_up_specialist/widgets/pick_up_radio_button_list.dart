import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_single_button.dart';

class PickUpRadioButtonList extends StatelessWidget {
  const PickUpRadioButtonList({
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
    return ListView.separated(
      itemBuilder: (context, index) => PickUpSingleButton(
        title: items[index],
        onSelect: () => onSelect(items[index]),
        isSelected: selectedItem == items[index],
      ),
      separatorBuilder: (_, __) => SizedBox(
        height: 8.h,
      ),
      itemCount: items.length,
    );
  }
}
