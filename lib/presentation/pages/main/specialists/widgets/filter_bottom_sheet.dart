import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mint/bloc/specialist_filter/specialist_filter_bloc.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_app_bar.dart';
import 'package:mint/presentation/pages/main/specialists/widgets/filter_section.dart';
import 'package:mint/presentation/widgets/bottom_sheet_fixed_container.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  bool _isFilterChanged(SpecialistFilterLoadSuccess state) {
    return state.selectedFilters != state.appliedFilters;
  }

  void _onClear() {
    context.read<SpecialistFilterBloc>().add(SpecialistFilterClearRequested());
    context.router.pop();
  }

  void _onFilterApply() {
    context.read<SpecialistFilterBloc>().add(SpecialistFilterApplied());
    context.router.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BottomSheetFixedContainer(
      appBar: FilterAppBar(onClear: _onClear),
      child: BlocBuilder<SpecialistFilterBloc, SpecialistFilterState>(
        builder: (context, state) {
          if (state is SpecialistFilterLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SpecialistFilterLoadSuccess) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(
                      vertical: 24.h,
                      horizontal: 16.w,
                    ),
                    child: FilterSection(
                      filter: state.specialistFilter,
                      selectedFilters: state.selectedFilters,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ElevatedButton(
                    onPressed: _isFilterChanged(state) ? _onFilterApply : null,
                    child: Text(l10n.applyFilters),
                  ),
                ),
                SizedBox(height: 26.h),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
