import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/pick_up_specialist/pick_up_specialist_bloc.dart';
import 'package:mint/domain/entity/pick_up_preferences/pick_up_preferences.dart';
import 'package:mint/injector/injector.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_radio_button_list.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_step_title.dart';
import 'package:mint/presentation/pages/main/pick_up_specialist/widgets/pick_up_stepper.dart';
import 'package:mint/presentation/widgets/mint_app_bar.dart';
import 'package:mint/routes/app_router.gr.dart';

import '../../../../domain/entity/price_range_model.dart';
import '../../../widgets/mint_multi_item_selection.dart';

@RoutePage()
class PickUpSpecialistPage extends StatelessWidget {
  const PickUpSpecialistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<PickUpSpecialistBloc>()..add(PickUpSpecialistFilterRequested()),
      child: const _PickUpSpecialistView(),
    );
  }
}

class _PickUpSpecialistView extends StatefulWidget {
  const _PickUpSpecialistView();

  @override
  State<_PickUpSpecialistView> createState() => _PickUpSpecialistViewState();
}

class _PickUpSpecialistViewState extends State<_PickUpSpecialistView> {
  int _currentStep = 0;

  final Map<String, bool> _haveYouBeenToTherapy = {
    'Yes': true,
    'No': false,
  };

  void _onValueSelected(PickUpPreferences preferences) {
    context
        .read<PickUpSpecialistBloc>()
        .add(PickUpSpecialistFilterSelected(preferences));
  }

  void _onFinish() {
    context.read<PickUpSpecialistBloc>().add(PickUpSpecialistFilterFinished());
    context.router.pop();
    context.router.navigate(const SpecialistsRoute());
  }

  bool _isNextAvailable(PickUpSpecialistLoadSuccess state, int index) {
    final preferences = state.pickUpPreferences;
    switch (index) {
      case 0:
        return preferences.communicationMember != null;
      case 1:
        return preferences.haveBeenToTherapy != null;
      case 2:
        return preferences.priceRange != null;
      case 3:
        return preferences.specializations != null;
    }
    return false;
  }

  /// Returns localized titles for price range given
  ///
  /// Can return either:
  ///
  /// If both low and high price passed => '_low_-_high_₴'
  ///
  /// If only high price passed => 'Up to _high_₴'
  ///
  /// If only low price passed => '_low_₴ and more'
  List<String> _getPriceRangeTitles(List<PriceRangeModel> priceList) {
    final l10n = context.l10n;
    return priceList.map((e) {
      final low = e.lowPrice;
      final high = e.highPrice;
      if (low  != null && high != null) {
        return '$low-$high₴';
      } else if (high != null) {
        return '${l10n.upTo} $high₴';
      } else if (low != null) {
        return '$low₴ ${l10n.andMore}';
      } else {
        return '';
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MintAppBar(leading: BackButton()),
      body: BlocBuilder<PickUpSpecialistBloc, PickUpSpecialistState>(
        builder: (context, state) {
          if (state is PickUpSpecialistLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PickUpSpecialistLoadSuccess) {
            final filter = state.pickUpFilter;
            final preferences = state.pickUpPreferences;
            final selectedSpecializations = preferences.specializations ?? [];
            return Padding(
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
                top: 16.h,
                bottom: 26.h,
              ),
              child: PickUpStepper(
                currentStep: _currentStep,
                onNextStep: _isNextAvailable(state, _currentStep)
                    ? () => setState(() => _currentStep += 1)
                    : null,
                onPreviousStep: () => setState(() => _currentStep -= 1),
                onFinish:
                    _isNextAvailable(state, _currentStep) ? _onFinish : null,
                steps: <Widget>[
                  PickUpStepTitle(
                    title: context.l10n.whoWillCommunicate,
                    child: PickUpRadioButtonList(
                      items: filter.communicationMembers,
                      itemTitles: filter.communicationMembers,
                      selectedItem: preferences.communicationMember,
                      onSelect: (communication) => _onValueSelected(
                        preferences.copyWith(
                          communicationMember: communication,
                        ),
                      ),
                    ),
                  ),
                  PickUpStepTitle(
                    title: context.l10n.haveYouEverBeenToTherapy,
                    child: PickUpRadioButtonList(
                      items: _haveYouBeenToTherapy.values.toList(),
                      itemTitles: _haveYouBeenToTherapy.keys.toList(),
                      selectedItem: preferences.haveBeenToTherapy,
                      onSelect: (haveYouBeenToTherapy) => _onValueSelected(
                        preferences.copyWith(
                          haveBeenToTherapy: haveYouBeenToTherapy,
                        ),
                      ),
                    ),
                  ),
                  PickUpStepTitle(
                    title: context.l10n.howMuchCanIPay,
                    child: PickUpRadioButtonList(
                      items: filter.priceRange,
                      itemTitles: _getPriceRangeTitles(filter.priceRange),
                      selectedItem: preferences.priceRange,
                      onSelect: (priceRange) => _onValueSelected(
                        preferences.copyWith(priceRange: priceRange),
                      ),
                    ),
                  ),
                  PickUpStepTitle(
                    title: context.l10n.whichTopicsAreYouInterestedIn,
                    child: MintMultiItemSelection(
                      items: filter.specializations,
                      itemTitles: filter.specializations,
                      selectedItems: selectedSpecializations,
                      onItemSelected: (specializations) => _onValueSelected(
                        preferences.copyWith(specializations: specializations),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
