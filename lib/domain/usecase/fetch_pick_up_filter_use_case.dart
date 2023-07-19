import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/filter_service.dart';

import '../entity/pick_up_filter/pick_up_filter.dart';

@injectable
class FetchPickUpFilterUseCase {
  FetchPickUpFilterUseCase(this._service);

  final FilterService _service;

  Future<PickUpFilter> call() => _service.getPickUpFilter();
}
