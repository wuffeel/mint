import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class FilePickerService {
  Future<String> loadFile(
    String localFileId,
    String fileUri, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  });

  Future<void> openFile(String localFileId);

  Future<types.PartialImage?> pickImage();

  Future<types.PartialFile?> pickFile();

  Future<types.PartialAudio> saveAudio(types.PartialAudio audioMessage);
}
