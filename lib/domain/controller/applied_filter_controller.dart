import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/filter_preferences/filter_preferences.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class AppliedFilterController {
  final _appliedController = BehaviorSubject<FilterPreferences>();

  Stream<FilterPreferences> get appliedFilters => _appliedController.stream;

  void addToAppliedStream(FilterPreferences appliedFilters) =>
      _appliedController.add(appliedFilters);
}
