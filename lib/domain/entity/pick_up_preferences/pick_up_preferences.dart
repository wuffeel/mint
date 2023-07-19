import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/price_range_model.dart';

part 'pick_up_preferences.freezed.dart';

@freezed
class PickUpPreferences with _$PickUpPreferences {
  const factory PickUpPreferences({
    String? communicationMember,
    bool? haveBeenToTherapy,
    PriceRangeModel? priceRange,
    List<String>? specializations,
  }) = _PickUpPreferences;

  const PickUpPreferences._();

  static const empty = PickUpPreferences();

  bool get isEmpty => this == empty;
}
