import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';

abstract class StorageRepository {
  Future<SpecialistModel> getSpecialistPhoto(SpecialistModel specialistModel);

  Future<UserModel> getUserPhoto(UserModel userModel);
}
