import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/domain/service/abstract/user_service.dart';

import '../../data/model/review_model_dto/review_model_dto.dart';
import '../../domain/entity/review_model/review_model.dart';

@Injectable(as: Factory<Future<ReviewModel?>, ReviewModelDto>)
class ReviewModelFromDto
    implements Factory<Future<ReviewModel?>, ReviewModelDto> {
  ReviewModelFromDto(this._service);

  final UserService _service;

  @override
  Future<ReviewModel?> create(ReviewModelDto param) async {
    final user = await _service.getUserData(param.userId);
    if (user == null) return null;
    return ReviewModel(
      user: user,
      rating: param.rating,
      createdAt: param.createdAt,
      content: param.content,
    );
  }
}
