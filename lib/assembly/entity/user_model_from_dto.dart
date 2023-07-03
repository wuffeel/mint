import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/user_model_dto.dart';
import 'package:mint/domain/entity/user_model.dart';

@Injectable(as: Factory<UserModel, UserModelDto>)
class UserModelFromDto implements Factory<UserModel, UserModelDto> {
  @override
  UserModel create(UserModelDto param) => UserModel(
        id: param.id,
        phoneNumber: param.phoneNumber,
        nameTag: param.nameTag,
        firstName: param.firstName,
        lastName: param.lastName,
        dateOfBirth: param.dateOfBirth,
      );
}