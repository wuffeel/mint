import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/storage_repository.dart';
import '../abstract/storage_service.dart';

@Injectable(as: StorageService)
class FirebaseStorageService implements StorageService {
  FirebaseStorageService(
    this._storageRepository,
  );

  final StorageRepository _storageRepository;

  @override
  Future<String?> getSpecialistPhoto(String? storageUrl) async {
    return _storageRepository.getSpecialistPhoto(storageUrl);
  }

  @override
  Future<String?> getUserPhoto(String? storageUrl) async {
    return _storageRepository.getUserPhoto(storageUrl);
  }
}
