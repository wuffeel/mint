import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

import '../entity/review_model/review_model.dart';

@injectable
class FetchSpecialistReviewsUseCase {
  FetchSpecialistReviewsUseCase(this._service);

  final SpecialistService _service;

  Future<List<ReviewModel>> call(String specialistId) =>
      _service.getSpecialistReviews(specialistId);
}
