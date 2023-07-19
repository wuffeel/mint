import 'package:injectable/injectable.dart';
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart';
import 'package:mint/data/repository/abstract/filter_repository.dart';
import 'package:mint/domain/service/abstract/filter_service.dart';

import '../../../assembly/factory.dart';
import '../../../data/model/specialist_filter_dto/specialist_filter_dto.dart';
import '../../entity/pick_up_filter/pick_up_filter.dart';
import '../../entity/specialist_filter/specialist_filter.dart';

@Injectable(as: FilterService)
class FirebaseFilterService implements FilterService {
  FirebaseFilterService(
    this._filterRepository,
    this._specialistFilterFromDto,
    this._pickUpFilterFromDto,
  );

  final FilterRepository _filterRepository;

  final Factory<SpecialistFilter, SpecialistFilterDto> _specialistFilterFromDto;
  final Factory<PickUpFilter, PickUpFilterDto> _pickUpFilterFromDto;

  @override
  Future<SpecialistFilter> getSpecialistFilter() async {
    final specialistFilter = await _filterRepository.getSpecialistFilter();
    return _specialistFilterFromDto.create(specialistFilter);
  }

  @override
  Future<PickUpFilter> getPickUpFilter() async {
    final pickUpFilter = await _filterRepository.getPickUpFilter();
    return _pickUpFilterFromDto.create(pickUpFilter);
  }
}
