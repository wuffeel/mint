import 'package:path/path.dart';

/// Returns the file extension from a given [filePath] in the format 'name.ext'.
String getFileExtension(String filePath) {
  return extension(filePath);
}
