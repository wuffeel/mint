import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/storage_repository.dart';

@Injectable(as: StorageRepository)
class FirebaseStorageRepository implements StorageRepository {
  final _storageRef = FirebaseStorage.instance.ref();

  @override
  Future<String?> getSpecialistPhoto(String? storageUrl) async {
    if (storageUrl != null) {
      return _storageRef.child(storageUrl).getDownloadURL();
    }

    return null;
  }

  @override
  Future<String?> getUserPhoto(String? storageUrl) async {
    if (storageUrl != null) {
      return _storageRef.child(storageUrl).getDownloadURL();
    }

    return null;
  }
}
