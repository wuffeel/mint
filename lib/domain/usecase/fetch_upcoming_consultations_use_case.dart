import 'package:injectable/injectable.dart';
import 'package:mint/domain/entity/upcoming_consultation_data/upcoming_consultation_data.dart';
import 'package:mint/domain/service/abstract/booking_service.dart';

@injectable
class FetchUpcomingConsultationsUseCase {
  FetchUpcomingConsultationsUseCase(this._service);

  final BookingService _service;

  Future<List<UpcomingConsultationData>> call(String userId) =>
      _service.getUpcomingConsultations(userId);
}
