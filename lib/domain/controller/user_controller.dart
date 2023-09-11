import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_core.dart';
import 'package:rxdart/rxdart.dart';

@lazySingleton
class UserController {
  final _userController = BehaviorSubject<PatientUser?>();

  Stream<PatientUser?> get user => _userController.stream;

  void addToUserStream(PatientUser? user) => _userController.add(user);
}
