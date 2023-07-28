import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/presentation/pages/main/sessions/widgets/slider_item.dart';

class ToggleSlider extends StatefulWidget {
  const ToggleSlider({
    super.key,
    required this.currentIndex,
    required this.items,
    required this.onItemTap,
    required this.offset,
  });

  final int currentIndex;
  final List<Widget> items;
  final void Function(int) onItemTap;
  final double offset;

  @override
  State<ToggleSlider> createState() => _ToggleSliderState();
}

class _ToggleSliderState extends State<ToggleSlider> {
  @override
  Widget build(BuildContext context) {
    final offset = widget.offset;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: IntrinsicHeight(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment(
                  (offset / (widget.items.length - 1)) * 2 - 1,
                  0,
                ),
                child: FractionallySizedBox(
                  widthFactor: 1 / widget.items.length,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ),
              Row(
                children: List.generate(
                  widget.items.length,
                  (index) => Expanded(
                    child: SliderItem(
                      duration: const Duration(milliseconds: 300),
                      isSelected: widget.currentIndex == index,
                      onTap: () => widget.onItemTap(index),
                      unselectedColor:
                          Theme.of(context).hintColor.withOpacity(0.3),
                      child: widget.items[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
