import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class FilePickerService {
  Future<void> loadFile(
    String localFileId,
    String fileUri,
    String fileExtension, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  });

  Future<void> openFile(String localFileId, String fileExtension);

  Future<types.PartialImage?> pickImage();

  Future<types.PartialFile?> pickFile();
}
