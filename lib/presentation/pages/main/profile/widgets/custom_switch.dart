import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.enabledColor,
    this.disabledColor,
    this.width,
    this.height,
    this.switchHeight,
    this.switchWidth,
    this.onTap,
  });

  final bool value;
  final Color? enabledColor;
  final Color? disabledColor;
  final double? width;
  final double? height;
  final double? switchHeight;
  final double? switchWidth;
  final ValueChanged<bool> onChanged;
  final VoidCallback? onTap;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation<Alignment> _circleAnimation;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
      end: widget.value ? Alignment.centerLeft : Alignment.centerRight,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  void _launchAnimation() {
    if (_animationController.isCompleted) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  void _onTap() {
    widget.value == false ? widget.onChanged(true) : widget.onChanged(false);

    final onTap = widget.onTap;
    if (onTap != null) onTap();
  }

  @override
  void didUpdateWidget(covariant CustomSwitch oldWidget) {
    if (oldWidget.value != widget.value) _launchAnimation();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: _onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: widget.width ?? 48.0,
            height: widget.height ?? 24.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: widget.value ? widget.enabledColor : widget.disabledColor,
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
              child: Container(
                alignment: _circleAnimation.value,
                child: Container(
                  width: widget.switchWidth ?? 20.0,
                  height: widget.switchHeight ?? 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 8.r,
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.15),
                      ),
                      BoxShadow(
                        blurRadius: 1.r,
                        offset: const Offset(0, 3),
                        color: Colors.black.withOpacity(0.06),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
