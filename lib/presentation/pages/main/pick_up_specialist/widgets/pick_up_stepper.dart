import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../theme/mint_text_styles.dart';

class PickUpStepper extends StatefulWidget {
  const PickUpStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onNextStep,
    required this.onPreviousStep,
    required this.onFinish,
  }) : assert(
          0 <= currentStep && currentStep < steps.length,
          'Current step do not fit in bounds from 0 to ${steps.length}',
        );

  final List<Widget> steps;
  final int currentStep;
  final VoidCallback? onNextStep;
  final VoidCallback? onPreviousStep;
  final VoidCallback? onFinish;

  @override
  State<PickUpStepper> createState() => _PickUpStepperState();
}

class _PickUpStepperState extends State<PickUpStepper> {
  final _pageController = PageController();

  /// Determine whether to call onNextStep or onFinish
  VoidCallback? get _nextAction => widget.currentStep + 1 < widget.steps.length
      ? widget.onNextStep != null
          ? _onNextStep
          : null
      : widget.onFinish;

  void _onNextStep() {
    final onNext = widget.onNextStep;
    if (widget.currentStep + 1 < widget.steps.length) {
      if (onNext != null) onNext();
      _pageController.animateToPage(
        widget.currentStep + 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPreviousStep() {
    final onPrevious = widget.onPreviousStep;
    if (widget.currentStep > 0) {
      if (onPrevious != null) onPrevious();
      _pageController.animateToPage(
        widget.currentStep - 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(context.l10n.helpUsMatchYou, style: MintTextStyles.title1),
              SizedBox(height: 16.h),
              Row(
                children: List.generate(
                  widget.steps.length,
                  (index) => Expanded(
                    child: AnimatedContainer(
                      height: 3.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: widget.currentStep == index
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).dividerColor,
                      ),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    ),
                  ),
                )..insertBetween(SizedBox(width: 8.w)),
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        if (widget.currentStep != 0) ...[
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: InkWell(
              onTap: _onPreviousStep,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(Icons.chevron_left),
                  Text(
                    context.l10n.previousStep,
                    style: MintTextStyles.caption1,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.h),
        ],
        Expanded(
          child: PageView(
            clipBehavior: Clip.none,
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.steps,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: ElevatedButton(
            onPressed: _nextAction,
            child: Text(context.l10n.next),
          ),
        ),
        SizedBox(height: 26.h),
      ],
    );
  }
}

// TODO(wuffeel): where this extension should be?
extension ExtendedWidgetList on List<Widget> {
  /// Insert [widget] between each member of this list
  List<Widget> insertBetween(Widget widget) {
    if (length > 1) {
      for (var i = length - 1; i > 0; i--) {
        insert(i, widget);
      }
    }

    return this;
  }
}
