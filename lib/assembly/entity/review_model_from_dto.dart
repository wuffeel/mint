import 'package:injectable/injectable.dart';
import 'package:mint_core/mint_assembly.dart';
import 'package:mint_core/mint_module.dart';

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
      id: param.id,
      user: user,
      specialistId: param.specialistId,
      rating: param.rating,
      createdAt: param.createdAt,
      content: param.content,
    );
  }
}
