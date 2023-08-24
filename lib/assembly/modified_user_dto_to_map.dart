import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';

import '../data/model/user_model_dto/user_model_dto.dart';

@Injectable(as: Factory<Map<String, dynamic>, UserModelDto>)
class ModifiedUserDtoToMap
    implements Factory<Map<String, dynamic>, UserModelDto> {
  @override
  Map<String, dynamic> create(UserModelDto param) {
    final resultMap = <String, dynamic>{
      'firstName': param.firstName,
      'lastName': param.lastName,
      'dateOfBirth': param.dateOfBirth,
    };
    final photoUrl = param.photoUrl;
    if (photoUrl != null && !photoUrl.startsWith('http')) {
      resultMap['photoUrl'] = photoUrl;
    }

    return resultMap;
  }
}
