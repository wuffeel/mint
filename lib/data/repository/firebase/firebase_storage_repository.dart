import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/storage_repository.dart';

@Injectable(as: StorageRepository)
class FirebaseStorageRepository implements StorageRepository {
  final _storage = FirebaseStorage.instance;

  Reference get _storageRef => _storage.ref();

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

  @override
  Future<String> uploadChatFile(
    String filePath,
    String fileId,
    String roomId,
  ) async {
    final file = File(filePath);
    final extension = file.path.split('.').last;
    final uploadedFile = await _storageRef
        .child('files/$roomId/$fileId.$extension')
        .putFile(file);

    return uploadedFile.ref.getDownloadURL();
  }

  @override
  Future<void> deleteStorageFile(String fileUrl) {
    return _storage.refFromURL(fileUrl).delete();
  }

  @override
  Future<String> uploadUserPhoto(String photoPath, String userId) async {
    final file = File(photoPath);
    final extension = file.path.split('.').last;
    final storagePath = 'users/$userId.$extension';
    await _storageRef.child(storagePath).putFile(file);
    return storagePath;
  }
}
