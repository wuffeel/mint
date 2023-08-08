abstract class StorageRepository {
  Future<String?> getSpecialistPhoto(String? storageUrl);

  Future<String?> getUserPhoto(String? storageUrl);

  Future<String> uploadChatFile(String filePath, String fileId, String roomId);

  Future<void> deleteStorageFile(String fileUrl);
}
