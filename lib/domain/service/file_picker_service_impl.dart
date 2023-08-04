import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

@Injectable(as: FilePickerService)
class FilePickerServiceImpl implements FilePickerService {
  /// Handles file load.
  ///
  /// Looks for local file existence by given [localFileId]. If it do not exist
  /// and [fileUri] is a hyperlink, starts the local-storing process. The file
  /// will be stored at application document directory with a [localFileId]
  /// name.
  ///
  /// [onLoadingCallback] and [onLoadedCallback] used to represent the file
  /// local load process
  @override
  Future<void> loadFile(
    String localFileId,
    String fileUri,
    String fileExtension, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  }) async {
    final documentsDir = (await getApplicationDocumentsDirectory()).path;
    final localPath = '$documentsDir/$localFileId.$fileExtension';
    final localExists = File(localPath).existsSync();

    if (fileUri.startsWith('http') && !localExists) {
      try {
        final onLoading = onLoadingCallback;
        if (onLoading != null) onLoading();

        final client = http.Client();
        final request = await client.get(Uri.parse(fileUri));
        final bytes = request.bodyBytes;

        final file = File(localPath);
        await file.writeAsBytes(bytes);
      } finally {
        final onLoaded = onLoadedCallback;
        if (onLoaded != null) onLoaded();
      }
    }
  }

  /// Looks for file at application document directory, which will be opened if
  /// found
  @override
  Future<void> openFile(String localFileId, String fileExtension) async {
    final documentsDir = (await getApplicationDocumentsDirectory()).path;
    final localPath = '$documentsDir/$localFileId.$fileExtension';
    await OpenFilex.open(localPath);
  }

  /// Handles image pick within phone's gallery. If picked, it will be returned
  /// as [types.PartialImage] with unique uuid
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

  /// Handles file pick. If picked, it will be returned as [types.PartialFile]
  /// with unique uuid
  @override
  Future<types.PartialFile?> pickFile() async {
    final file = await FilePicker.platform.pickFiles(withData: true);

    if (file != null && file.files.single.path != null) {
      final uuid = const Uuid().v4();
      final pickFile = file.files.single;
      final extension = pickFile.name.split('.').last;

      final message = types.PartialFile(
        name: pickFile.name,
        size: pickFile.size,
        uri: pickFile.path ?? '',
        metadata: {'uuid': uuid},
      );

      final bytes = pickFile.bytes;
      if (bytes != null) {
        final documentsDir = (await getApplicationDocumentsDirectory()).path;
        final localPath = '$documentsDir/$uuid.$extension';
        final localFile = File(localPath);
        await localFile.writeAsBytes(bytes);
      }

      return message;
    }
    return null;
  }
}
