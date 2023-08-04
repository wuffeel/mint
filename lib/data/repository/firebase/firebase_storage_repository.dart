import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/storage_repository.dart';
import 'package:mint/utils/file_utils.dart';

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
    final fileExtension = FileUtils.getFileExtensionByPath(file.path);
    final uploadedFile = await _storageRef
        .child('files/$roomId/$fileId.$fileExtension')
        .putFile(file);

    return uploadedFile.ref.getDownloadURL();
  }

  @override
  Future<void> deleteStorageFile(String fileUrl) {
    return _storage.refFromURL(fileUrl).delete();
  }
}
