import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/user_model_dto.dart';

@Injectable(as: Factory<UserModelDto, Map<String, dynamic>>)
class UserModelDtoFromJson
    implements Factory<UserModelDto, Map<String, dynamic>> {
  @override
  UserModelDto create(Map<String, dynamic> param) => UserModelDto(
        id: param['id'] as String,
        phoneNumber: param['phoneNumber'] as String?,
        pinCode: param['pinCode'] as String?,
        nameTag: param['nameTag'] as String?,
        firstName: param['firstName'] as String?,
        lastName: param['lastName'] as String?,
        dateOfBirth: param['dateOfBirth'] as DateTime?,
      );
}
