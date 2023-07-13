import '../../model/pick_up_filter_dto/pick_up_filter_dto.dart';
import '../../model/specialist_filter_dto/specialist_filter_dto.dart';

abstract class FilterRepository {
  Future<SpecialistFilterDto> getSpecialistFilter();

  Future<PickUpFilterDto> getPickUpFilter();
}
