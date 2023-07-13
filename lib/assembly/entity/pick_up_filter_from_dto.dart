import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/domain/entity/price_range_model.dart';

import '../../data/model/pick_up_filter_dto/pick_up_filter_dto.dart';
import '../../domain/entity/pick_up_filter/pick_up_filter.dart';

@Injectable(as: Factory<PickUpFilter, PickUpFilterDto>)
class PickUpFilterFromDto implements Factory<PickUpFilter, PickUpFilterDto> {
  @override
  PickUpFilter create(PickUpFilterDto param) {
    final priceList = param.priceRange
        .map(PriceRangeModel.fromTag)
        .whereType<PriceRangeModel>()
        .toList();

    return PickUpFilter(
      communicationMembers: param.communicationMembers,
      priceRange: priceList,
      specializations: param.specializations,
    );
  }
}
