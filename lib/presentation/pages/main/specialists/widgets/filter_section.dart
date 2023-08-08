import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:mint/domain/entity/specialist_filter/specialist_filter.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_price_slider.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_single_item_selection.dart';
import 'package:mint/utils/experience/experience_localization.dart';

import '../../../../../domain/entity/experience_model.dart';
import '../../../../../theme/mint_text_styles.dart';
import '../../../../widgets/mint_multi_item_selection.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({
    super.key,
    required this.filter,
    required this.selectedFilters,
  });

  final SpecialistFilter filter;
  final FilterPreferences selectedFilters;

  void _onPreferencesChange(
    BuildContext context,
    FilterPreferences preferences,
  ) {
    context
        .read<SpecialistFilterBloc>()
        .add(SpecialistFilterSelected(preferences));
  }

  void _onPriceChange(BuildContext context, RangeValues values) {
    final lowPrice = values.start.toInt();
    final highPrice = values.end.toInt();
    return _onPreferencesChange(
      context,
      selectedFilters.copyWith(
        lowPrice: lowPrice != filter.minPrice ? lowPrice : null,
        highPrice: highPrice != filter.maxPrice ? highPrice : null,
      ),
    );
  }

  List<String> _getExperienceFilterTitles(
    BuildContext context,
    List<ExperienceModel> experienceList,
  ) {
    final locale = context.l10n.localeName;
    return experienceList.map((experienceModel) {
      return ExperienceLocalization.format(
        experienceModel: experienceModel,
        locale: locale,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selectedSpecializations = selectedFilters.specializations ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.price, style: MintTextStyles.headline),
        SizedBox(height: 16.h),
        FilterPriceSlider(
          minPrice: filter.minPrice,
          maxPrice: filter.maxPrice,
          rangeValues: RangeValues(
            selectedFilters.lowPrice?.toDouble() ?? filter.minPrice.toDouble(),
            selectedFilters.highPrice?.toDouble() ?? filter.maxPrice.toDouble(),
          ),
          onChangeEnd: (values) => _onPriceChange(context, values),
        ),
        SizedBox(height: 24.h),
        Text(l10n.experience, style: MintTextStyles.headline),
        SizedBox(height: 16.h),
        FilterSingleItemSelection(
          items: filter.experience,
          itemTitles: _getExperienceFilterTitles(context, filter.experience),
          selectedItem: selectedFilters.experience,
          onSelect: (experience) => _onPreferencesChange(
            context,
            selectedFilters.copyWith(experience: experience),
          ),
          itemInnerPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 8.w,
          ),
        ),
        SizedBox(height: 24.h),
        Text(l10n.specialities, style: MintTextStyles.headline),
        SizedBox(height: 16.h),
        MintMultiItemSelection(
          items: filter.specializations,
          itemTitles: filter.specializations,
          selectedItems: selectedSpecializations,
          hasCheckMark: true,
          onItemSelected: (specializations) => _onPreferencesChange(
            context,
            selectedFilters.copyWith(specializations: specializations),
          ),
          itemInnerPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 8.w,
          ),
        ),
      ],
    );
  }
}
