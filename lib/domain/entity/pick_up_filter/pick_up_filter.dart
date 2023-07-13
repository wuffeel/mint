import 'package:freezed_annotation/freezed_annotation.dart';

import '../price_range_model.dart';

part 'pick_up_filter.freezed.dart';

@freezed
class PickUpFilter with _$PickUpFilter {
  const factory PickUpFilter({
    required List<String> communicationMembers,
    required List<PriceRangeModel> priceRange,
    required List<String> specializations,
  }) = _PickUpFilter;

  const PickUpFilter._();

  static const empty = PickUpFilter(
    communicationMembers: [],
    priceRange: [],
    specializations: [],
  );

  bool get isEmpty => this == empty;
}
