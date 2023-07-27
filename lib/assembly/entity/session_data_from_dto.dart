import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/session_data_dto/session_data_dto.dart';
import 'package:mint/domain/entity/session_data/session_data.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

@Injectable(as: Factory<Future<SessionData?>, SessionDataDto>)
class SessionDataFromDto
    implements Factory<Future<SessionData?>, SessionDataDto> {
  SessionDataFromDto(this._service);

  final SpecialistService _service;

  @override
  Future<SessionData?> create(
    SessionDataDto param,
  ) async {
    final specialist = await _service.getSpecialist(param.specialistId);
    if (specialist == null) return null;
    return SessionData(
      id: param.id,
      specialistModel: specialist,
      notes: param.notes,
      bookTime: param.bookTime,
      durationMinutes: param.durationMinutes,
    );
  }
}
