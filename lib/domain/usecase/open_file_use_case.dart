import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';

@injectable
class OpenFileUseCase {
  OpenFileUseCase(this._service);

  final FilePickerService _service;

  Future<void> call(String fileName) => _service.openFile(fileName);
}
