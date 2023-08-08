import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';

part 'review_model.freezed.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    required String id,
    required UserModel user,
    required String specialistId,
    required double rating,
    required DateTime createdAt,
    String? content,
  }) = _ReviewModel;
}
