import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/user_model_dto/user_model_dto.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';
import 'package:mint/domain/service/abstract/storage_service.dart';

@Injectable(as: Factory<Future<UserModel>, UserModelDto>)
class UserModelFromDto implements Factory<Future<UserModel>, UserModelDto> {
  UserModelFromDto(this._service);

  final StorageService _service;

  @override
  Future<UserModel> create(UserModelDto param) async => UserModel(
        id: param.id,
        phoneNumber: param.phoneNumber,
        pinCode: param.pinCode,
        nameTag: param.nameTag,
        photoUrl: await _service.getUserPhoto(param.photoUrl),
        firstName: param.firstName,
        lastName: param.lastName,
        dateOfBirth: param.dateOfBirth,
      );
}
