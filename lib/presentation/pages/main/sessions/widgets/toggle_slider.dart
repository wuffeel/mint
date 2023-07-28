import 'dart:developer';

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

  final double? currentIndex;
  final List<String> items;
  final void Function(int) onItemTap;
  final double offset;

  @override
  State<ToggleSlider> createState() => _ToggleSliderState();
}

class _ToggleSliderState extends State<ToggleSlider> {
  @override
  Widget build(BuildContext context) {
    final offset = widget.offset;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: IntrinsicHeight(
        child: Stack(
          children: <Widget>[
            AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              alignment:  Alignment(
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
                    isSelected: widget.currentIndex == index,
                    onTap: () => widget.onItemTap(index),
                    title: widget.items[index],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
