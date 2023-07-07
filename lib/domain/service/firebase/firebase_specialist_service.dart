import 'package:injectable/injectable.dart';
import 'package:mint/assembly/factory.dart';
import 'package:mint/data/model/specialist_model_dto/specialist_model_dto.dart';
import 'package:mint/data/repository/abstract/specialist_repository.dart';
import 'package:mint/domain/entity/specialist_model/specialist_model.dart';
import 'package:mint/domain/service/abstract/specialist_service.dart';
import 'package:mint/domain/service/abstract/storage_service.dart';

@Injectable(as: SpecialistService)
class FirebaseSpecialistService implements SpecialistService {
  FirebaseSpecialistService(
    this._specialistRepository,
    this._storageService,
    this._specialistModelFromDto,
  );

  final SpecialistRepository _specialistRepository;
  final StorageService _storageService;
  final Factory<SpecialistModel, SpecialistModelDto> _specialistModelFromDto;

  @override
  Future<List<SpecialistModel>> getSpecialistsOnline() async {
    final specialists = await _specialistRepository.getSpecialistsOnline();
    return _getSpecialistListWithPhotos(specialists);
  }

  @override
  Future<List<SpecialistModel>> getFavoriteSpecialists(String userId) async {
    final favoriteSpecialists =
        await _specialistRepository.getFavoriteSpecialists(userId);
    return favoriteSpecialists.map(_specialistModelFromDto.create).toList();
  }

  @override
  Future<void> addToFavorite(String userId, String specialistId) {
    return _specialistRepository.addToFavorite(userId, specialistId);
  }

  @override
  Future<void> removeFromFavorite(String userId, String specialistId) {
    return _specialistRepository.removeFromFavorite(userId, specialistId);
  }

  Future<List<SpecialistModel>> _getSpecialistListWithPhotos(
    List<SpecialistModelDto> specialistModelDtoList,
  ) async {
    final specialistList =
        specialistModelDtoList.map(_specialistModelFromDto.create).toList();
    final specialistFutures =
        specialistList.map(_storageService.getSpecialistPhoto);
    return Future.wait(specialistFutures);
  }
}
