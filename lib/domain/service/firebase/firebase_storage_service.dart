import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/storage_repository.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/entity/user_model/user_model.dart';

import '../abstract/storage_service.dart';

@Injectable(as: StorageService)
class FirebaseStorageService implements StorageService {
  FirebaseStorageService(this._storageRepository);

  final StorageRepository _storageRepository;

  @override
  Future<SpecialistModel> getSpecialistPhoto(SpecialistModel specialist) async {
    return _storageRepository.getSpecialistPhoto(specialist);
  }

  @override
  Future<UserModel> getUserPhoto(UserModel user) async {
    return _storageRepository.getUserPhoto(user);
  }
}
