import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';

@injectable
class LoadFileUseCase {
  LoadFileUseCase(this._service);

  final FilePickerService _service;

  Future<String> call(
    String localFileId,
    String fileUri, {
    void Function()? onLoadingCallback,
    void Function()? onLoadedCallback,
  }) =>
      _service.loadFile(
        localFileId,
        fileUri,
        onLoadingCallback: onLoadingCallback,
        onLoadedCallback: onLoadedCallback,
      );
}
