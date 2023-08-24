import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/domain/service/abstract/file_picker_service.dart';

@injectable
class PickImageUseCase {
  PickImageUseCase(this._service);

  final FilePickerService _service;

  Future<PartialImage?> call() => _service.pickImage();
}
