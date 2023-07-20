import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/specialist_work_info_dto/specialist_work_info_dto.dart';
import 'package:mint/data/repository/abstract/booking_repository.dart';

@Injectable(as: BookingRepository)
class FirebaseBookingRepository implements BookingRepository {
  final _functionsInstance = FirebaseFunctions.instance;

  static const _bookingInfoFunction = 'fetchBookingInformation';

  @override
  Future<SpecialistWorkInfoDto> getSpecialistBookInfo(
    String specialistId,
  ) async {
    final callable = _functionsInstance.httpsCallable(_bookingInfoFunction);

    final result = await callable.call<Map<String, dynamic>>({
      'specialistId': specialistId,
    });

    final data = result.data;

    return SpecialistWorkInfoDto.fromJson(data);
  }
}
