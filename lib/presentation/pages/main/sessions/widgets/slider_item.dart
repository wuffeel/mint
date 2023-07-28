import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class SliderItem extends StatefulWidget {
  const SliderItem({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.title,
  });

  final bool isSelected;
  final VoidCallback onTap;
  final String title;

  @override
  State<SliderItem> createState() => _SliderItemState();
}

class _SliderItemState extends State<SliderItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Color?> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animation = ColorTween(
      begin: MintColors.greyLight.withOpacity(0.3),
      end: Colors.white,
    ).animate(_controller);
    _controller.addListener(
      () => setState(() {
        // TODO(wuffeel): nothing here. Updates animation
      }),
    );
    if (widget.isSelected) _controller.forward();
  }

  @override
  void didUpdateWidget(SliderItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Handle the color animation when isSelected changes
    if (widget.isSelected != oldWidget.isSelected) {
      if (widget.isSelected) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Center(
          child: Text(
            widget.title,
            style: MintTextStyles.title3.copyWith(color: _animation.value),
          ),
        ),
      ),
    );
  }
}
