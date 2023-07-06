import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/storage_repository.dart';
import 'package:mint/domain/entity/specialist_model.dart';
import 'package:mint/domain/entity/user_model.dart';

@Injectable(as: StorageRepository)
class FirebaseStorageRepository implements StorageRepository {
  final _storageRef = FirebaseStorage.instance.ref();

  @override
  Future<SpecialistModel> getSpecialistPhoto(SpecialistModel specialist) async {
    final photo = specialist.photoUrl;
    if (photo == null) return specialist;
    final specialistPhoto = await _storageRef.child(photo).getDownloadURL();
    return specialist.copyWith(photoUrl: specialistPhoto);
  }

  @override
  Future<UserModel> getUserPhoto(UserModel user) async {
    final photo = user.photo;
    if (photo == null) return user;
    final userPhoto = await _storageRef.child(photo).getDownloadURL();
    return user.copyWith(photo: userPhoto);
  }
}
