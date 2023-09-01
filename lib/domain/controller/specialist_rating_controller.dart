import 'dart:async';

import 'package:injectable/injectable.dart';

/// Record representation of specialists rating changed
typedef SpecialistRating = ({
  double rating,
  int reviewCount,
  String specialistId,
});

@lazySingleton
class SpecialistRatingController {
  final _ratingController = StreamController<SpecialistRating>.broadcast();

  Stream<SpecialistRating> get rating => _ratingController.stream;

  void addToSpecialistRatingStream(SpecialistRating rating) =>
      _ratingController.add(rating);
}
