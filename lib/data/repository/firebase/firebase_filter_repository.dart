import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/pick_up_filter_dto/pick_up_filter_dto.dart';
import 'package:mint/data/model/specialist_filter_dto/specialist_filter_dto.dart';
import 'package:mint/data/repository/abstract/filter_repository.dart';
import 'package:mint_core/mint_module.dart';

@Injectable(as: FilterRepository)
class FirebaseFilterRepository implements FilterRepository {
  FirebaseFilterRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  static const _filterCollection = 'filter';

  static const _filterId = 'specialist_filter';
  static const _pickUpId = 'pick_up_filter';

  Future<CollectionReference<Map<String, dynamic>>>
      get _filterCollectionRef async {
    return (await _firebaseInitializer.firestore).collection(_filterCollection);
  }

  @override
  Future<SpecialistFilterDto> getSpecialistFilter() async {
    final filterCollection = await _filterCollectionRef;
    final filterSnapshot = await filterCollection.doc(_filterId).get();

    final filterData = filterSnapshot.data();
    if (filterData == null) return SpecialistFilterDto.empty;

    return SpecialistFilterDto.fromJson(filterData);
  }

  @override
  Future<PickUpFilterDto> getPickUpFilter() async {
    final filterCollection = await _filterCollectionRef;
    final pickUpSnapshot = await filterCollection.doc(_pickUpId).get();

    final pickUpFilterData = pickUpSnapshot.data();
    if (pickUpFilterData == null) return PickUpFilterDto.empty;

    return PickUpFilterDto.fromJson(pickUpFilterData);
  }
}
