import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_page_display.dart';

import '../../../../../theme/mint_text_styles.dart';

class PickUpStepper extends StatefulWidget {
  const PickUpStepper({
    super.key,
    required this.steps,
    required this.onFinish,
    required this.stepAvailableBuilder,
  });

  final List<Widget> steps;
  final VoidCallback? onFinish;
  final bool Function(int) stepAvailableBuilder;

  @override
  State<PickUpStepper> createState() => _PickUpStepperState();
}

class _PickUpStepperState extends State<PickUpStepper> {
  final _pageController = PageController();
  int _currentStep = 0;

  /// Determine whether to call onNextStep or onFinish
  VoidCallback? get _nextAction {
    return _currentStep + 1 < widget.steps.length
        ? widget.stepAvailableBuilder(_currentStep)
            ? _onNextStep
            : null
        : widget.stepAvailableBuilder(_currentStep)
            ? widget.onFinish
            : null;
  }

  void _onNextStep() {
    if (_currentStep < widget.steps.length) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onPreviousStep() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
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
              PickUpPageDisplay(
                itemCount: widget.steps.length,
                currentStep: _currentStep,
              ),
            ],
          ),
        ),
        SizedBox(height: 24.h),
        if (_currentStep != 0) ...[
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
            onPageChanged: (index) => setState(() => _currentStep = index),
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
