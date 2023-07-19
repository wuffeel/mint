import '../../entity/pick_up_filter/pick_up_filter.dart';
import '../../entity/specialist_filter/specialist_filter.dart';

abstract class FilterService {
  Future<SpecialistFilter> getSpecialistFilter();

  Future<PickUpFilter> getPickUpFilter();
}
