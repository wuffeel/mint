import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/domain/service/abstract/storage_service.dart';

import '../../data/model/user_model_dto/user_model_dto.dart';
import '../../domain/entity/user_model/user_model.dart';

@Injectable(as: Factory<Future<UserModelDto>, UserModel>)
class UserModelToDto implements Factory<Future<UserModelDto>, UserModel> {
  UserModelToDto(this._service);

  final StorageService _service;

  @override
  Future<UserModelDto> create(UserModel param) async {
    final photo = param.photoUrl;
    return UserModelDto(
      id: param.id,
      firstName: param.firstName,
      lastName: param.lastName,
      dateOfBirth: param.dateOfBirth,
      photoUrl: photo != null && !photo.startsWith('http')
          ? await _service.uploadUserPhoto(photo, param.id)
          : photo,
      phoneNumber: param.phoneNumber,
      pinCode: param.pinCode,
      nameTag: param.nameTag,
    );
  }
}
