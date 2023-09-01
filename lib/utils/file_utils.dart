/// Returns the file extension from a given [fileName] in the format 'name.ext'.
String getFileExtension(String fileName) {
  return fileName.split('.').last;
}
