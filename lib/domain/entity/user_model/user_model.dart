import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    String? phoneNumber,
    String? pinCode,
    String? photo,
    String? nameTag,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
  }) = _UserModel;
}
