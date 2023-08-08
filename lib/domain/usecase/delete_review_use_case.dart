import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

import '../entity/review_model/review_model.dart';

@injectable
class DeleteReviewUseCase {
  DeleteReviewUseCase(this._service);

  final SpecialistService _service;

  Future<void> call(ReviewModel reviewModel) =>
      _service.deleteSpecialistReview(reviewModel);
}
