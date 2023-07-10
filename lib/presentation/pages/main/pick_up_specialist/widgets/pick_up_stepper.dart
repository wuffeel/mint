import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';

import '../../../../../gen/colors.gen.dart';
import '../../../../../theme/mint_text_styles.dart';

class PickUpStepper extends StatefulWidget {
  const PickUpStepper({
    super.key,
    required this.steps,
    required this.currentStep,
    required this.onNextStep,
    required this.onPreviousStep,
  }) : assert(
          0 <= currentStep && currentStep < steps.length,
          'Current step do not fit in bounds from 0 to ${steps.length}',
        );

  final List<Widget> steps;
  final int currentStep;
  final VoidCallback onNextStep;
  final VoidCallback onPreviousStep;

  @override
  State<PickUpStepper> createState() => _PickUpStepperState();
}

class _PickUpStepperState extends State<PickUpStepper> {
  Color _getUnselectedColor() {
    return Theme.of(context).brightness == Brightness.dark
        ? MintColors.separatorDark
        : MintColors.separatorLight;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 16.h),
        Text(context.l10n.helpUsMatchYou, style: MintTextStyles.title1),
        SizedBox(height: 16.h),
        Row(
          children: List.generate(
            widget.steps.length,
            (index) => Expanded(
              child: Container(
                height: 3.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: widget.currentStep == index
                      ? Theme.of(context).colorScheme.primary
                      : _getUnselectedColor(),
                ),
              ),
            ),
          )..insertBetween(SizedBox(width: 8.w)),
        ),
        SizedBox(height: 24.h),
        if (widget.currentStep != 0) ...[
          InkWell(
            onTap: widget.onPreviousStep,
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.chevron_left),
                Text('Previous'),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
        Expanded(
          child: widget.steps[widget.currentStep],
        ),
        ElevatedButton(
          onPressed: widget.onNextStep,
          child: Text(
            'Next',
            style: MintTextStyles.headline,
          ),
        ),
        SizedBox(height: 26.h),
      ],
    );
  }
}

extension ExtendedWidgetList on List<Widget> {
  /// Insert [widget] between each member of this list
  List<Widget> insertBetween(Widget widget) {
    if (length > 1) {
      for (var i = length - 1; i > 0 ; i--) {
        insert(i, widget);
      }
    }

    return this;
  }
}
