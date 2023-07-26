import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/upcoming_consultation_data_dto/upcoming_consultation_data_dto.dart';
import 'package:mint/domain/entity/upcoming_consultation_data/upcoming_consultation_data.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';

@Injectable(
    as: Factory<Future<UpcomingConsultationData?>, UpcomingConsultationDataDto>)
class UpcomingConsultationDataFromDto
    implements
        Factory<Future<UpcomingConsultationData?>,
            UpcomingConsultationDataDto> {
  UpcomingConsultationDataFromDto(this._service);

  final SpecialistService _service;

  @override
  Future<UpcomingConsultationData?> create(
    UpcomingConsultationDataDto param,
  ) async {
    final specialist = await _service.getSpecialist(param.specialistId);
    if (specialist == null) return null;
    return UpcomingConsultationData(
      id: param.id,
      specialistModel: specialist,
      notes: param.notes,
      bookTime: param.bookTime,
      durationMinutes: param.durationMinutes,
    );
  }
}
