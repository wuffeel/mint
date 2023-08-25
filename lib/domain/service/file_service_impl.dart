import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/file_repository.dart';
import 'package:mint/domain/service/abstract/file_service.dart';

@Injectable(as: FileService)
class FileServiceImpl implements FileService {
  FileServiceImpl(this._fileRepository);

  final FileRepository _fileRepository;

  @override
  Future<String> loadFile(
    String fileName,
    String fileUri, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  }) async {
    return _fileRepository.loadFile(
      fileName,
      fileUri,
      onLoadingCallback: onLoadingCallback,
      onLoadedCallback: onLoadedCallback,
    );
  }

  @override
  Future<void> openFile(String fileName) async {
    return _fileRepository.openFile(fileName);
  }

  @override
  Future<types.PartialImage?> pickImage() async {
    return _fileRepository.pickImage();
  }

  @override
  Future<types.PartialFile?> pickFile() async {
    return _fileRepository.pickFile();
  }

  @override
  Future<types.PartialAudio> saveAudio(types.PartialAudio audioMessage) async {
    return _fileRepository.saveAudio(audioMessage);
  }

  @override
  Future<void> deleteLocalFile(String fileName) async {
    return _fileRepository.deleteLocalFile(fileName);
  }
}
