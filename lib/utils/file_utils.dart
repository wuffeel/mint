class FileUtils {
  static String getFileExtensionByPath(String fileName) {
    return fileName.split('.').last;
  }
}
