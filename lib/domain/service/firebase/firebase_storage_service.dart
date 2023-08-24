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

  @override
  Future<String> uploadChatFile(String filePath, String fileId, String roomId) {
    return _storageRepository.uploadChatFile(filePath, fileId, roomId);
  }

  @override
  Future<void> deleteStorageFile(String fileUrl) {
    return _storageRepository.deleteStorageFile(fileUrl);
  }

  @override
  Future<String> uploadUserPhoto(String photoPath, String userId) {
    return _storageRepository.uploadUserPhoto(photoPath, userId);
  }
}
