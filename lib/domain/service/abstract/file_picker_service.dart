import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

abstract class FilePickerService {
  /// [fileName] should be with file extension provided
  Future<String> loadFile(
    String fileName,
    String fileUri, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  });

  /// [fileName] should be with file extension provided
  Future<void> openFile(String fileName);

  Future<types.PartialImage?> pickImage();

  Future<types.PartialFile?> pickFile();

  Future<types.PartialAudio> saveAudio(types.PartialAudio audioMessage);
}
