abstract class StorageRepository {
  Future<String?> getSpecialistPhoto(String? storageUrl);

  Future<String?> getUserPhoto(String? storageUrl);
}
