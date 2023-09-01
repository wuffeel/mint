import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class FileService {
  Future<String> loadFile(
    String fileName,
    String fileUri, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  });

  Future<void> openFile(String fileName);

  Future<types.PartialImage?> pickImage();

  Future<types.PartialFile?> pickFile();

  Future<types.PartialAudio> saveAudio(types.PartialAudio audioMessage);

  Future<void> deleteLocalFile(String fileName);
}
