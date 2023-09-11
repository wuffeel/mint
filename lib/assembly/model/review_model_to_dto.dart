import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';

import '../../data/model/review_model_dto/review_model_dto.dart';
import '../../domain/entity/review_model/review_model.dart';

@Injectable(as: Factory<ReviewModelDto, ReviewModel>)
class ReviewModelToDto implements Factory<ReviewModelDto, ReviewModel> {
  @override
  ReviewModelDto create(ReviewModel param) => ReviewModelDto(
        id: param.id,
        userId: param.user.id,
        specialistId: param.specialistId,
        rating: param.rating,
        createdAt: param.createdAt,
        content: param.content,
      );
}
