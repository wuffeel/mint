import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_app_bar.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_single_item_selection.dart';
import 'package:mint/presentation/widgets/bottom_sheet_container.dart';
import 'package:mint/presentation/widgets/mint_multi_item_selection.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../../theme/custom_range_thumb_shape.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  final double _minPrice = 0;
  final double _maxPrice = 1000;

  late RangeValues _priceRangeValues = RangeValues(_minPrice, _maxPrice);

  final List<String> _experience = [
    'no exprience',
    'from 1 to 3 years',
    'from 4 to 7 years',
    'more than 7 years',
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

  final List<String> _selectedSpecialities = [];
  String? _selectedExperience;

  bool get _isFilterApplied =>
      _selectedSpecialities.isNotEmpty ||
      _selectedExperience != null ||
      _priceRangeValues.start != _minPrice ||
      _priceRangeValues.end != _maxPrice;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: FilterAppBar(
              onClear: () {
                // TODO(wuffeel): add onClear callback
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.price, style: MintTextStyles.headline),
                  SizedBox(height: 16.h),
                  SliderTheme(
                    data: Theme.of(context).sliderTheme.copyWith(
                          rangeThumbShape: CustomRangeThumbShape(
                            thumbSize: 12.r,
                            values: _priceRangeValues,
                            textColor: Theme.of(context).primaryColor,
                          ),
                        ),
                    child: RangeSlider(
                      min: _minPrice,
                      max: _maxPrice,
                      values: _priceRangeValues,
                      onChanged: (values) => setState(() {
                        _priceRangeValues = values;
                      }),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(l10n.experience, style: MintTextStyles.headline),
                  SizedBox(height: 16.h),
                  FilterSingleItemSelection(
                    items: _experience,
                    selectedItem: _selectedExperience,
                    onSelect: (experience) => setState(
                      () => _selectedExperience = experience,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Text(l10n.specialities, style: MintTextStyles.headline),
                  SizedBox(height: 16.h),
                  MintMultiItemSelection(
                    items: _specialities,
                    selectedItems: _selectedSpecialities,
                    hasCheckMark: true,
                    onAdd: (speciality) => setState(
                      () => _selectedSpecialities.add(speciality),
                    ),
                    onRemove: (speciality) => setState(
                      () => _selectedSpecialities.remove(speciality),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ElevatedButton(
              onPressed: _isFilterApplied ? () {
                // TODO(wuffeel): apply filters
              } : null,
              child: Text(l10n.applyFilters),
            ),
          ),
          SizedBox(height: 26.h),
        ],
      ),
    );
  }
}
