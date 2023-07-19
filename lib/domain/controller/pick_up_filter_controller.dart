import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class PickUpFilterController {
  final _pickUpController = BehaviorSubject<FilterPreferences>();

  Stream<FilterPreferences> get pickUpFilters => _pickUpController.stream;

  /// Add filter preferences to stream. These preferences then will be handled
  /// by SpecialistFilterBloc
  void addToPickUpStream(FilterPreferences appliedFilters) =>
      _pickUpController.add(appliedFilters);
}
