import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_radio_button_list.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_step_title.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_stepper.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';

import '../../../widgets/mint_multi_item_selection.dart';

@RoutePage()
class PickUpSpecialistPage extends StatefulWidget {
  const PickUpSpecialistPage({super.key});

  @override
  State<PickUpSpecialistPage> createState() => _PickUpSpecialistPageState();
}

class _PickUpSpecialistPageState extends State<PickUpSpecialistPage> {
  int _currentStep = 0;

  String? _selectedCommunication;
  String? _selectedHaveYouBeenToTherapy;
  String? _selectedPayForSession;
  final List<String> _selectedSpecialities = [];

  final List<String> _communicationOptions = [
    'Only me',
    'Me and my partner',
    'Me and my child',
    'Child'
  ];

  final List<String> _haveYouBeenToTherapy = [
    'Yes',
    'No',
  ];

  final List<String> _howMuchCanPayForSession = [
    'Up to 1000₴',
    '500-1000₴',
    '1000-2000₴',
    'More than 2000₴',
  ];

  final List<String> _specialities = [
    'Motivation',
    'Panic',
    'Burnout',
    'Depression',
    'Self-confidence',
    'Immigration',
    'Stress',
    'Purpose in life',
    'Relationships',
    'Career',
    'Cheat',
    'Finance',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MintAppBar(leading: BackButton()),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: PickUpStepper(
          steps: [
            PickUpStepTitle(
              title: context.l10n.whoWillCommunicate,
              child: PickUpRadioButtonList(
                items: _communicationOptions,
                selectedItem: _selectedCommunication,
                onSelect: (communication) => setState(
                  () => _selectedCommunication = communication,
                ),
              ),
            ),
            PickUpStepTitle(
              title: context.l10n.haveYouEverBeenToTherapy,
              child: PickUpRadioButtonList(
                items: _haveYouBeenToTherapy,
                selectedItem: _selectedHaveYouBeenToTherapy,
                onSelect: (haveYouBeenToTherapy) => setState(
                  () => _selectedHaveYouBeenToTherapy = haveYouBeenToTherapy,
                ),
              ),
            ),
            PickUpStepTitle(
              title: context.l10n.howMuchCanIPay,
              child: PickUpRadioButtonList(
                items: _howMuchCanPayForSession,
                selectedItem: _selectedPayForSession,
                onSelect: (payForSession) => setState(
                  () => _selectedPayForSession = payForSession,
                ),
              ),
            ),
            MintMultiItemSelection(
              items: _specialities,
              selectedItems: _selectedSpecialities,
              onAdd: (speciality) => setState(
                () => _selectedSpecialities.add(speciality),
              ),
              onRemove: (speciality) => setState(
                () => _selectedSpecialities.remove(speciality),
              ),
            ),
          ],
          currentStep: _currentStep,
          onNextStep: () => setState(() => _currentStep += 1),
          onPreviousStep: () => setState(() => _currentStep -= 1),
        ),
      ),
    );
  }
}
