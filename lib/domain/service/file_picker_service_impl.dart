import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';
import 'package:mint/utils/file_utils.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: FilePickerService)
class FilePickerServiceImpl implements FilePickerService {
  /// Handles file load. Returns path to the file.
  ///
  /// Looks for local file existence by given [fileName]. If it do not exist
  /// and [fileUri] is a hyperlink, starts the local-storing process. The file
  /// will be stored at application document directory with a [fileName]
  /// name.
  ///
  /// [onLoadingCallback] and [onLoadedCallback] used to represent the file
  /// local load process
  @override
  Future<String> loadFile(
    String fileName,
    String fileUri, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  }) async {
    final localPath = await _getLocalFilePath(fileName);
    final localExists = File(localPath).existsSync();

    if (fileUri.startsWith('http') && !localExists) {
      try {
        onLoadingCallback?.call();
        final uri = Uri.parse(fileUri);
        await _downloadFile(uri, localPath);
      } finally {
        onLoadedCallback?.call();
      }
    }

    return localPath;
  }

  /// Opens a file located in the application's document directory.
  @override
  Future<void> openFile(String fileName) async {
    final localPath = await _getLocalFilePath(fileName);
    await OpenFilex.open(localPath);
  }

  /// Handles picking an image from the phone's gallery.
  ///
  /// If an image is picked, it will be returned as a [types.PartialImage] with
  /// a unique UUID.
  @override
  Future<types.PartialImage?> pickImage() async {
    final image = await ImagePicker().pickImage(
      imageQuality: 70,
      source: ImageSource.gallery,
    );

    if (image != null) {
      final uuid = const Uuid().v4();
      final bytes = await image.readAsBytes();

      final message = types.PartialImage(
        name: image.name,
        size: bytes.length,
        uri: image.path,
        metadata: {'uuid': uuid},
      );

      return message;
    }

    return null;
  }

  /// Handles picking a file from the phone's storage.
  ///
  /// If a file is picked, it will be returned as a [types.PartialFile] with
  /// a unique UUID.
  @override
  Future<types.PartialFile?> pickFile() async {
    final file = await FilePicker.platform.pickFiles(withData: true);

    if (file != null &&
        file.files.isNotEmpty &&
        file.files.single.path != null) {
      final uuid = const Uuid().v4();
      final pickFile = file.files.single;

      final message = types.PartialFile(
        name: pickFile.name,
        size: pickFile.size,
        uri: pickFile.path ?? '',
        metadata: {'uuid': uuid},
      );

      final bytes = pickFile.bytes;
      if (bytes != null) {
        final extension = getFileExtension(pickFile.name);
        await _writeFileAsBytes('$uuid.$extension', bytes);
      }

      return message;
    }
    return null;
  }

  /// Handles saving an audio message locally.
  ///
  /// Given [audioMessage] will be returned with unique a UUID.
  @override
  Future<types.PartialAudio> saveAudio(types.PartialAudio audioMessage) async {
    final uuid = const Uuid().v4();
    final uri = Uri.parse(audioMessage.uri);
    final file = File.fromUri(uri);
    final bytes = await file.readAsBytes();

    final extension = getFileExtension(audioMessage.name);
    await _writeFileAsBytes('$uuid.$extension', bytes);

    final message = types.PartialAudio(
      duration: audioMessage.duration,
      name: audioMessage.name,
      size: audioMessage.size,
      uri: uri.path,
      metadata: {'uuid': uuid},
    );
    return message;
  }

  /// Downloads a file from the given [fileUri] and saves it to the [localPath].
  Future<void> _downloadFile(Uri fileUri, String localPath) async {
    final client = http.Client();
    final request = await client.get(fileUri);
    final bytes = request.bodyBytes;

    final file = File(localPath);
    await file.writeAsBytes(bytes);
  }

  /// Generates the local file path for a given [fileName].
  Future<String> _getLocalFilePath(String fileName) async {
    final documentsDir = await getApplicationDocumentsDirectory();
    return '${documentsDir.path}/$fileName';
  }

  /// Writes the given [bytes] to a local file with the specified [fileName].
  Future<void> _writeFileAsBytes(String fileName, List<int> bytes) async {
    final localPath = await _getLocalFilePath(fileName);
    final localFile = File(localPath);
    await localFile.writeAsBytes(bytes);
  }
}
